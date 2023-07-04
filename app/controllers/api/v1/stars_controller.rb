module Api
  module V1
    class StarsController < ApplicationController
      def index
        # FIXME: 正式な Star モデルに変更する
        stars = ::OnSheet::Star.all

        # 返すカラムから id と timestamps は除外する
        render json: stars, except: %i[id created_at updated_at]
      end
    end
  end
end
