class OauthController < ApplicationController
  def authorize
    redirect_to "https://app.hubspot.com/oauth/authorize?client_id=#{ENV['HUBSPOT_CLIENT_ID']}&redirect_uri=#{ENV['HUBSPOT_REDIRECT_URI']}&scope=#{ENV['HUBSPOT_SCOPES']}", allow_other_host: true
  end

  def callback
    @resp = Hubspot.create_token!(params[:code])
  end
end
