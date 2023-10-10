class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default from: '"Support Team" <support@speedrail.com>'

  # rubocop:disable Lint/MissingSuper
  def self.inherited(subclass)
    # lets mailer views live in views/mailers, much cleaner
    subclass.default template_path: "mailers/#{subclass.name.to_s.underscore}"
  end
  # rubocop:enable Lint/MissingSuper
end
