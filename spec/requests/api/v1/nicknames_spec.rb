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

    it '本来の名前と同じ名前のリクエストでは本来の名前をそのまま返すこと' do
      # フリック -> フリック
      get '/api/v1/nicknames/%E3%83%95%E3%83%AA%E3%83%83%E3%82%AF'

      expect(response).to have_http_status(:success)
      expect(response.body).to eq '["フリック"]'
    end

    it 'シート上に同名で 2つ 以上の同じ呼称が書かれている場合にそのうちの一つしか返ってこないこと' do
      get '/api/v1/nicknames/Geddoe'

      expect(response).to have_http_status(:success)
      expect(response.body).to eq '["ゲド"]'
    end
  end
end
