class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: '"Speedrail" <support@speedrail.com>'

  # mailer views live in views/mailers
  def self.inherited(subclass)
    subclass.default template_path: "mailers/#{subclass.name.to_s.underscore}"
  end
end
