class GssCharacterToProductTitle < ApplicationRecord
  belongs_to :gss_character, class_name: 'Gss::Character'
  belongs_to :product_title
end
