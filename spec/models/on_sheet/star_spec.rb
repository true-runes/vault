require 'rails_helper'

RSpec.describe OnSheet::Star, type: :model do
  describe 'OnSheet::Star クラス' do
    it 'レコードの数が 108 であること' do
      expect(OnSheet::Star.count).to eq 108
    end
  end
end
