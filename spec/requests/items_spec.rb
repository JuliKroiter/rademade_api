require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  # initialize test data
  let!(:category) {create(:category)}
  let!(:items) { create_list(:item, 10, category: category) }
  let(:item_id) { items.first.id }

  describe 'GET /v1/items' do
    before { get '/v1/items' }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /v1/items/:id' do
    before { get "/v1/items/#{item_id}" }

    context 'when the record exists' do
      it 'returns the item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe 'GET /v1/items/by_category' do
    let!(:another_items) { create_list(:item, 10) }

    before { get "/v1/items/by_category?category_ids=#{category.id}" }

    it 'returns items by category' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
