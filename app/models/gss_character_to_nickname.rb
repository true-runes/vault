class GssCharacterToNickname < ApplicationRecord
  belongs_to :gss_character, class_name: 'Gss::Character', foreign_key: :gss_character_id
  belongs_to :nickname, class_name: 'Nickname', foreign_key: :nickname_id
end
