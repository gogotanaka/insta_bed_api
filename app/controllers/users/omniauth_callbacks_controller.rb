class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    auth = request.env["omniauth.auth"]

    unless @user = User.where(provider: auth.provider, uid: auth.uid).first
      @user = User.create(
                          provider:         auth.provider,
                          uid:              auth.uid,
                          name:             auth.info.name,
                          email:            auth.info.email,
                          password:         Devise.friendly_token[0,20],
                          oauth_token:      auth.credentials.token,
                          oauth_expires_at: auth.credentials.expires_at,
                          facebook_url:     auth.info.urls[:Facebook]
                        )
    end

    begin
      @user.remote_image_url = valid_url(auth.info.image, 2)
      @user.save
    rescue
    end

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    end
  end

  private def valid_url(url, limit)
    raise ArgumentError, 'HTTP redirect too deep' if limit <= 0
    response = Net::HTTP.get_response(URI.parse(url))
    case response
    when Net::HTTPSuccess
      url
    when Net::HTTPRedirection
      valid_url response['location'], limit - 1
    else
      raise ItemNotFound
    end
  end
end
