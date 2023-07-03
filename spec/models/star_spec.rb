require 'rails_helper'

RSpec.describe Star, type: :model do
  describe 'Star クラス' do
    it 'レコードの数が 108 であること' do
      expect(Star.count).to eq 108
    end
  end
end
