class AuthenticationTokenService
  HMAC_SECRET = Rails.application.credentials[:jws_token][:hmac_secret]
  ALGORITHM = Rails.application.credentials[:jws_token][:algorithm]

  def self.encode(user_id)
    payload = { user_id: user_id }
    JWT.encode payload, HMAC_SECRET, ALGORITHM
  end

  def self.decode(token)
    JWT.decode(
      token,
      HMAC_SECRET,
      true,
      { algorithm: ALGORITHM }
    ).first['user_id']
  end
end
