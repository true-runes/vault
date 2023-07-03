require 'rails_helper'

RSpec.describe OnSheet::Star, type: :model do
  describe 'OnSheet::Star クラス' do
    it 'レコードの数が 108 であること' do
      sheet_stars = OnSheet::Star.all

      expect(sheet_stars.count).to eq 108
    end
  end
end
