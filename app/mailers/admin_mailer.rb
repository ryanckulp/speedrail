class AdminMailer < ApplicationMailer
  def error(subject, context = nil)
    @context = context
    mail(to: Rails.application.credentials.admin_email, subject: subject)
  end
end
