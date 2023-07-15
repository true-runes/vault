class Title < ApplicationRecord
  has_many :gss_character_to_titles, class_name: 'GssCharacterToTitle'
  has_many :gss_characters, through: :gss_character_to_titles
end
