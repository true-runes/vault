require 'rails_helper'

RSpec.describe Star, type: :model do
  describe 'Star クラス' do
    it 'レコードの数が 108 であること' do
      stars = Star.all

      expect(stars.count).to eq 108
    end
  end
end
