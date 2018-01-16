require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  let!(:categories) { create_list(:category, 10) }

  describe 'GET /v1/categories' do
    before { get '/v1/categories' }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
