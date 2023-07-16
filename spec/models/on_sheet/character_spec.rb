require 'rails_helper'

RSpec.describe OnSheet::Character, type: :model do
  describe 'レコード数' do
    it '存在すること' do
      expect(OnSheet::Character.count).to be > 0
    end

    it '重複が存在するので 108 * 7 よりかは少ないこと' do
      expect(OnSheet::Character.count).to be < 108 * 7
    end
  end
end
