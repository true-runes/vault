module Api
  module V1
    class StarsController < ApplicationController
      def index
        stars = Star.all

        # 返すカラムから id と timestamps は除外する
        render json: stars, except: %i[id created_at updated_at]
      end

      def show
        star = Star.find_by(name: params[:name])

        if star.blank?
          render json: {}
        else
          render json: {
            star: star.attributes.slice('name', 'yomi', 'name_en'),
            characters: star.characters.pluck(:name)
          }
        end
      end
    end
  end
end
