class CharacterString < ApplicationRecord
  has_many :characters, dependent: :destroy
end
