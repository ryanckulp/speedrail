class SubscribeController < ApplicationController
  before_action :authenticate_user!
  before_action :maybe_skip_onboarding

  def index
    ab_finished(:cta, reset: false) # reset:false prevents a user from triggering duplicate completions
  end
end
