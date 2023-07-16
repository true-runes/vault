module Gss
  # NOTE: ここで foreign_key を指定しないと SQL が適切に構成されない
  class Character < ApplicationRecord
    has_many :gss_character_to_product_titles,
             class_name: 'Gss::CharacterToProductTitle',
             foreign_key: :gss_character_id
    has_many :product_titles,
             through: :gss_character_to_product_titles,
             class_name: 'ProductTitle',
             foreign_key: :product_title_id

    has_many :gss_character_to_nicknames,
             class_name: 'GssCharacterToNickname',
             foreign_key: :gss_character_id
    has_many :nicknames,
             through: :gss_character_to_nicknames,
             class_name: 'Nickname',
             foreign_key: :nickname_id
  end
end
