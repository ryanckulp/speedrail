class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: '"Support Team" <support@speedrail.com>'

  after_action :create_mail_log

  # Default to mailer views in `views/mailers`
  def self.inherited(subclass)
    super(subclass)
    subclass.default template_path: "mailers/#{subclass.name.to_s.underscore}"
  end

  private

  def already_sent?(recipients, since: DateTime.now.at_beginning_of_month)
    MailLog.where(mailer: action_name, to: recipients, created_at: since..Time.now).exists?
  end

  def create_mail_log
    params = {
      to: mail.to.join(', '),
      mailer: action_name,
      subject: mail.subject,
      body: mail.body.encoded
    }

    if defined?(@user)
      params[:user_id] = @user.id
    end

    MailLog.create(params)
  end
end
