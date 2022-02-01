class AdminMailer < ApplicationMailer
  def error(subject, context = nil)
    @context = context
    mail(to: ENV['admin_email'], subject: subject)
  end
end
