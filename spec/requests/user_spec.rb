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

    context 'valid params' do
      it 'makes a new user' do
        post '/users', params: params

        expect(User.all.count).to eq 1
        expect(response.content_type).to include('application/json')
        expect(response).to have_http_status(:created)
      end
    end

    xcontext 'invalid params' do
      it 'returns validation errors' do
      end
    end
  end

  xdescribe '.show' do
    context 'valid token' do
      it 'returns user information' do
      end
    end
  end
end
