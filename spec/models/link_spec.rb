require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { Link.create(original_url: 'http://google.com') }
  let!(:short_url_list) { ShortUrlList.create(short_url: 'qwertyu') }

  before do
    link.set_short_url
    short_url_list.reload
  end

  context '#set_short_url' do
    it 'adds assosiation between self and short_url_list' do
      expect(link.short_url_list_id).to eq(short_url_list.id)
      expect(short_url_list.link_id).to eq(link.id)
    end
  end

  context '#short_url' do
    it 'returns the short_url from short_url_list' do
      expect(link.short_url).to eq(short_url_list.short_url)
    end
  end
end
