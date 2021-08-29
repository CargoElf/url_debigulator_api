require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let(:error) do
      "{\"error\":\"param is missing or the value is empty: username\\nDid you mean?  username\\n               password\\n               controller\\n               action\"}"
    end

    it 'authenticates the client' do
      post '/authenticate', params: { authenticate: { username: 'bob', password: 'password' } }

      expect(response).to have_http_status(:created)
      expect(response.body).to eq({ token: '123' })
    end

    it 'returns error if params are invalid' do
      post '/authenticate', params: { username: '', password: '' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to eq(error)
    end
  end
end
