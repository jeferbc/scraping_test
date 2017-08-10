require 'rails_helper'

RSpec.describe 'contents API', type: :request do
  # initialize test data
  let!(:contents) { create_list(:content, 10) }

  describe 'GET /contents' do
    before { get '/contents' }

    it 'returns contents' do
      # `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    context 'get context paginated' do
      before { get '/contents?page=1&per_page=5' }

      it 'returns contents paginated' do
        # `json` is a custom helper to parse JSON responses
        expect(json).not_to be_empty
        expect(json['data'].size).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /contents' do
    # valid payload
    let(:valid_attributes) { { url: 'spec/factories/test_webpage.html' } }

    context 'when the request is valid' do
      before { post '/contents', params: valid_attributes }

      it 'creates contents' do
        expect(json['data'].size).to eq(4)
        expect(json['data'][0]['attributes']['tag']).to eq('h1')
        expect(json['data'][0]['attributes']['content']).to eq('test h1')
        expect(json['data'][3]['attributes']['tag']).to eq('a')
        expect(json['data'][3]['attributes']['content']).to eq('http://test.com')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/contents', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Url can't be blank/)
      end
    end
  end
end
