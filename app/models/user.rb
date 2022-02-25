class User < ApplicationRecord
  include Signupable
  include Onboardable
  include Billable
end
