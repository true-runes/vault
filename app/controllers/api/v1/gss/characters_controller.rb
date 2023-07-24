module Api
  module V1
    module Gss
      class CharactersController < ApplicationController
        def index
          gss_characters = ::Gss::Character.all

          render json: gss_characters.pluck(:name)
        end

        def show
          gss_character = ::Gss::Character.find_by(name: params[:name])

          if gss_character.blank?
            render json: {}
          else
            shown_data = {
              gss_name: gss_character.name,
              nicknames: gss_character.nicknames.pluck(:name),
              product_titles: gss_character.product_titles.pluck(:name)
            }

            render json: shown_data
          end
        end
      end
    end
  end
end
