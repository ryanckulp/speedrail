module Onboardable
  extend ActiveSupport::Concern

  after_create do
    delay.send_welcome_email
  end

  def finished_onboarding?
    stripe_subscription_id?
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
end
