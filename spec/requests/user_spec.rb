require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'POST /create' do
    let(:params) do
      {
        user: {
          username: 'bob',
          email: 'qwerty@asdf.zxc',
          password: 'password',
        }
      }
    end

    let(:errors) do
      {
        messages: [
          {
            password: ["can't be blank"],
            username: ["can't be blank"],
            email:    ["can't be blank"],
          }
        ]
      }.to_json
    end

    it 'makes a new user' do
      post '/users', params: params

      expect(User.all.count).to eq(1)
      expect(response.body).to eq({ messages: ['bob created'] }.to_json)
      expect(response).to have_http_status(:created)
    end

    it 'returns validation errors' do
      post  '/users', params: { user: { username: '' } }

      expect(User.all.count).to eq 0
      expect(response).to have_http_status(:bad_request)
      expect(response.body).to eq(errors)
    end
  end
end
