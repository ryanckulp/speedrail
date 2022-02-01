class SubscribeController < ApplicationController
  before_action :authenticate_user!
  before_action :maybe_skip_onboarding

  def index
  end
end
