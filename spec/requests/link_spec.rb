require 'rails_helper'

RSpec.describe 'Link', type: :request do
  let!(:user) { User.create(username: 'bob', email: 'test', password: '1234') }
  let!(:short_url) { ShortUrlList.create(short_url: 'halp') }

  describe 'POST /users/:id/link' do
    it 'creates a new link' do
      post "/users/#{user.id}/link", params: { id: user.id, url: 'https://test.com' }

      expect(response).to have_http_status(:created)
      expect(response.body).to eq("{\"messages\":[\"localhost:3000/halp\"]}")
    end

    it 'returns an error when given incorrect params' do
      post "/users/#{user.id}/link", params: { id: '' }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to eq("{\"message\":[\"incorrect params\"]}")
    end
  end
end
