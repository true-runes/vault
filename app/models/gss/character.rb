module Gss
  class Character < ApplicationRecord
    has_many :gss_character_to_titles, class_name: 'GssCharacterToTitle'
    has_many :product_titles, through: :gss_character_to_titles
  end
end
