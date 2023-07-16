class Character < ApplicationRecord
  belongs_to :star, optional: true
  belongs_to :character_string
end
