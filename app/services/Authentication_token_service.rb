class AuthenticationTokenService
  def self.call(user_id)
    hmac_secret = Rails.application.credentials[:jws_token][:hmac_secret]
    algorithm = Rails.application.credentials[:jws_token][:algorithm]

    payload = { user_id: user_id }
    JWT.encode payload, hmac_secret, algorithm
  end
end
