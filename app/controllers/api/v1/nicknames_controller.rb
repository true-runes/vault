module Api
  module V1
    class NicknamesController < ApplicationController
      def index
        render json: Nickname.pluck(:name)
      end

      def show
        nickname = Nickname.find_by(name: params[:name])

        if nickname.blank?
          render json: []
        else
          render json: nickname.gss_characters.pluck(:name)
        end
      end
    end
  end
end
