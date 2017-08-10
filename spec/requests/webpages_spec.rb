require 'rails_helper'

RSpec.describe 'webpages API', type: :request do
  # initialize test data
  let!(:webpages) { create_list(:webpage, 10) }

  describe 'GET /webpages' do
    before { get '/webpages' }

    it 'returns webpages' do
      # `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'get context paginated' do
      before { get '/webpages?page=1&per_page=5' }

      it 'returns webpages paginated' do
        # `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['data'].size).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
