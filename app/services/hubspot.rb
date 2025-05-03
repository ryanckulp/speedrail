class Hubspot
  TOKEN_BASE_URL = 'https://api.hubapi.com/oauth/v1/token'.freeze

  def self.create_token!(code)
    body = {
      grant_type: 'authorization_code',
      code: code
    }.merge(auth_params)

    HTTParty.post(TOKEN_BASE_URL, body: body)
  end

  def self.refresh_token!(user)
    body = {
      grant_type: 'refresh_token',
      refresh_token: user.try(:hubspot_refresh_token)
    }.merge(auth_params)

    resp = HTTParty.post(TOKEN_BASE_URL, body: body)
    user.update(hubspot_access_token: resp['access_token'])
  end

  def self.auth_params
    {
      client_id: ENV['HUBSPOT_CLIENT_ID'],
      client_secret: ENV['HUBSPOT_CLIENT_SECRET'],
      redirect_uri: ENV['HUBSPOT_REDIRECT_URI']
    }
  end
end