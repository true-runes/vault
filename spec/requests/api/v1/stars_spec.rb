require 'rails_helper'

RSpec.describe 'Api::V1::Stars', type: :request do
  describe 'GET #index' do
    before do
      get '/api/v1/stars'
    end

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns json' do
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
