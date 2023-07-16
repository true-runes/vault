class Nickname < ApplicationRecord
  has_many :gss_character_to_nicknames, class_name: 'GssCharacterToNickname'
  has_many :gss_characters, through: :gss_character_to_nicknames, class_name: 'Gss::Character'
end
