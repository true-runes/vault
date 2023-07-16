class ProductTitle < ApplicationRecord
  has_many :gss_character_to_product_titles, class_name: 'Gss::CharacterToProductTitle'
  has_many :gss_characters, through: :gss_character_to_product_titles, class_name: 'Gss::Character'
end
