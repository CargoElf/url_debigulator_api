require 'rails_helper'

RSpec.describe 'ShortUrlList', type: :request do
  describe 'GET /show' do
    let!(:link) { Link.create!(original_url: 'https://google.com', short_url_list: short_url) }
    let(:short_url) { ShortUrlList.create!(short_url: 'abcdefg') }
    let!(:_) { short_url.update(link: link) }

    it 'redirects to the original url' do
      get '/abcdefg'

      expect(response).to have_http_status(:redirect)
    end

    it "doesn't redirect if there is no match" do
      get '/wut'

      expect(response).to have_http_status(:not_found)
    end
  end
end
