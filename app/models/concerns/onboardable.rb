module Onboardable
  extend ActiveSupport::Concern

  included do
    after_create :send_welcome_email
  end

  def finished_onboarding?
    stripe_subscription_id?
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
  # handle_asynchronously :send_welcome_email
end
