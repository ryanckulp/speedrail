class OauthController
  def callback
    user = User.find(params[:state]) # optional param to maintain statefulness before/after authorization
    url = "https://oauth2.googleapis.com/token"

    body = {
      code: params[:code],
      client_id: ENV['YOUTUBE_CLIENT_ID'],
      client_secret: ENV['YOUTUBE_CLIENT_SECRET'],
      redirect_uri: oauth_callback_url, # => "#{ENV['BASE_URL']}/oauth/callback"
      grant_type: 'authorization_code'
    }

    resp = HTTParty.post(url, body: body)
    JSON.parse(resp.body) # => { 'access_token' => 'a29.xxx', 'refresh_token' => 'xxxx', 'expires_in' => 3599, 'token_type' => 'bearer' }
  end
end