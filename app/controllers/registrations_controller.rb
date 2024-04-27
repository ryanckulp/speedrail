class RegistrationsController < Devise::RegistrationsController
  before_action :protect_from_spam, only: [:create]
end
