class OauthController < ApplicationController
  def authorize
    redirect_to "https://app.hubspot.com/oauth/authorize?client_id=0d6463f1-43cf-4156-9aa8-aa14e52020a2&redirect_uri=#{ENV['HUBSPOT_REDIRECT_URI']}&scope=#{ENV['HUBSPOT_SCOPES']}", allow_other_host: true
  end

  def callback
    @resp = Hubspot.create_token!(params[:code])
  end
end
