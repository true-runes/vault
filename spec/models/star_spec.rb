require 'rails_helper'

RSpec.describe Star, type: :model do
  describe 'Star クラス' do
    xit 'レコードの数が 108 であること' do
      stars = Star.all

      expect(stars.count).to eq 108
    end
  end
end
