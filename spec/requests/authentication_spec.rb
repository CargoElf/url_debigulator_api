require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let!(:user) { User.create(username: 'bob', password: 'lulz') }
    let(:token) { AuthenticationTokenService.encode(user.id) }

    let(:error) do
      "{\"error\":\"param is missing or the value is empty: authenticate\\nDid you mean?  action\\n               username\\n               controller\\n               password\"}"
    end

    it 'authenticates the client' do
      post '/authenticate', params: { authenticate: { username: 'bob', password: 'lulz' } }

      expect(response).to have_http_status(:created)
      expect(response.body).to eq("{\"token\":\"#{token}\"}")
    end

    it 'returns error if params are invalid' do
      post '/authenticate', params: { username: '', password: '' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to eq(error)
    end
  end
end
