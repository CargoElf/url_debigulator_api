require 'rails_helper'

RSpec.describe 'Link', type: :request do
  let!(:user) { User.create(username: 'bob', email: 'test', password: '1234') }
  let!(:short_url) { ShortUrlList.create(short_url: 'halp') }
  let(:auth_header) do
    {
      'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMSJ9.WPCFqHz59SZvAJLtCkL4LUph8tFFXzXU0Y2I2uOA7UM'
    }
  end

  describe 'POST /link' do
    it 'creates a new link' do
      post "/link", params: {
        id: user.id,
        url: 'https://test.com',
      }, headers: auth_header

      expect(response).to have_http_status(:created)
      expect(response.body).to eq("{\"messages\":[\"localhost:3000/halp\"]}")
    end

    it 'returns an error when given incorrect params' do
      post "/link", params: { rando: 'yo' }, headers: auth_header

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.body).to eq("{\"message\":[\"incorrect params\"]}")
    end
  end
end
