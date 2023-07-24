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

    describe '戻り値（フリック）' do
      before do
        get '/api/v1/gss/characters/%E3%83%95%E3%83%AA%E3%83%83%E3%82%AF'
      end

      it 'keys が期待どおりの値を含むこと' do
        expect(JSON.parse(response.body).keys).to eq(
          %w[gss_name nicknames product_titles]
        )
      end
    end

    describe '戻り値（ゲオルグ）' do
      before do
        get '/api/v1/gss/characters/%E3%82%B2%E3%82%AA%E3%83%AB%E3%82%B0'
      end

      it 'keys に期待どおりの値を含むこと' do
        expect(JSON.parse(response.body).keys).to be_empty
      end
    end

    describe '戻り値（ゲオルグ・プライム）' do
      before do
        get '/api/v1/gss/characters/%E3%82%B2%E3%82%AA%E3%83%AB%E3%82%B0%E3%83%BB%E3%83%97%E3%83%A9%E3%82%A4%E3%83%A0'
      end

      it 'product_titles に期待どおりの値を含むこと' do
        # 順番は保証されないでよい
        expect(JSON.parse(response.body)['product_titles']).to match_array(
          %w[幻想水滸伝II 幻想水滸外伝Vol.1 幻想水滸伝V]
        )
      end
    end
  end
end
