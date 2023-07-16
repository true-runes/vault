module Gss
  class CharacterToProductTitle < ApplicationRecord
    belongs_to :gss_character, class_name: 'Gss::Character', foreign_key: :gss_character_id
    belongs_to :product_title, class_name: 'ProductTitle', foreign_key: :product_title_id
  end
end
