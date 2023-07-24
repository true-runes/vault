require 'rails_helper'

RSpec.describe 'Api::V1::Gss::Characters', type: :request do
  describe 'GET /index' do
    describe '200 を返すこと' do
      before do
        get '/api/v1/gss/characters'
      end

      it { expect(response).to have_http_status(:success) }
    end

    describe '要素数が 108 以上であること' do
      before do
        get '/api/v1/gss/characters'
      end

      it { expect(JSON.parse(response.body).count).to be >= 108 }
    end
  end

  describe 'GET /show' do
    describe '200 を返すこと' do
      before do
        get '/api/v1/gss/characters/%E3%83%95%E3%83%AA%E3%83%83%E3%82%AF'
      end

      it { expect(response).to have_http_status(:success) }
    end

    describe '戻り値の key' do
      before do
        get '/api/v1/gss/characters/%E3%83%95%E3%83%AA%E3%83%83%E3%82%AF'
      end

      it '期待どおりの値を含むこと' do
        expect(JSON.parse(response.body).keys).to eq(
          %w[gss_name nicknames product_titles]
        )
      end
    end
  end
end
