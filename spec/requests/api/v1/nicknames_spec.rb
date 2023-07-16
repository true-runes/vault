require 'rails_helper'

RSpec.describe 'Api::V1::Nicknames', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/nicknames'

      expect(response).to have_http_status(:success)
      expect(Nickname.count).to be > 500
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      # 坊ちゃん
      get '/api/v1/nicknames/%E5%9D%8A%E3%81%A1%E3%82%83%E3%82%93'

      expect(response).to have_http_status(:success)
    end

    it 'returns expected contents' do
      # 坊ちゃん
      get '/api/v1/nicknames/%E5%9D%8A%E3%81%A1%E3%82%83%E3%82%93'

      expect(response.body).to eq '["幻水1主人公（坊ちゃん）"]'
    end

    it 'Nickname が存在しない場合は空っぽのレスポンスであること' do
      get '/api/v1/nicknames/hogehoge'

      expect(response).to have_http_status(:success)
      expect(response.body).to eq '[]'
    end
  end
end
