class Character < ApplicationRecord
  belongs_to :star, optional: true
end
