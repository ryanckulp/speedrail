class OauthController < ApplicationController
  before_action :authenticate_user!

  # 1. visit /oauth/authorize to kick off OAuth2 sequence
  def authorize
    redirect_to authorize_url, allow_other_host: true
  end

  # 2. after accepting oauth2 permissions, user is sent here with a '?code=' param
  def callback
    headers = { 'content-type' => 'application/x-www-form-urlencoded' }
    auth = { username: ENV['TWITTER_OAUTH_CLIENT_ID'], password: ENV['TWITTER_OAUTH_CLIENT_SECRET'] }

    # 3. send the 'code' param back to twitter to swap it for an API token
    @resp = HTTParty.post("https://api.twitter.com/2/oauth2/token?code=#{params[:code]}&grant_type=authorization_code&client_id=#{ENV['TWITTER_OAUTH_CLIENT_ID']}&redirect_uri=#{redirect_uri}&code_verifier=challenge",
      headers: headers,
      basic_auth: auth
    )

    # 4. api credentials (expiry, refresh token, access token, scopes) will be rendered in view
  end

  private

  # TODO - change this to match your 3rd party service's registered "redirect_uri"
  def redirect_uri
    ERB::Util.url_encode("#{ENV['BASE_URL']}/oauth/callback")
  end

  def authorize_url
    "https://twitter.com/i/oauth2/authorize?response_type=code&client_id=#{ENV['TWITTER_OAUTH_CLIENT_ID']}&redirect_uri=#{redirect_uri}&scope=tweet.read%20users.read%20bookmark.read%20offline.access&state=#{current_user.id}&code_challenge=challenge&code_challenge_method=plain"
  end
end
