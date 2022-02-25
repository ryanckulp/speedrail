class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable

  scope :subscribed, -> { where(paying_customer: true) }
end
