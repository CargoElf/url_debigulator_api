require 'rails_helper'

RSpec.describe AuthenticationTokenService do
  let(:token) { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.ylpztta5CnepOvMn0Vl7UZOqzERIGleFWuirNiH8ILs' }

  describe '.decode' do
    it 'returns a user_id' do
      expect(described_class.decode(token)).to eq(1)
    end
  end

  describe '.encode' do
    it 'returns a token' do
      expect(described_class.encode(1)).to eq(token)
    end
  end
end
