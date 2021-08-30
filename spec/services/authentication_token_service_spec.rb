require 'rails_helper'

RSpec.describe AuthenticationTokenService do
  describe '.call' do
    let(:token) { described_class.call(1) }
    let(:hmac_secret) { Rails.application.credentials[:jws_token][:hmac_secret] }
    let(:algorithm) { Rails.application.credentials[:jws_token][:algorithm] }

    let(:decoded_token) do
      JWT.decode(
        token,
        hmac_secret,
        true,
        { algorithm: algorithm }
      )
    end

    it 'returns an authentication token' do
      expect(decoded_token).to eq([{ "user_id" => 1 }, { "alg" => algorithm }])
    end
  end
end
