class Star < ApplicationRecord
  has_many :characters

  enum category: {
    '天罡星三十六星': 0,
    '地煞星七十二星': 1
  }
end
