require 'rails_helper'

RSpec.describe OnSheet::Title, type: :model do
  describe 'OnSheet::Title クラス' do
    it 'タイトルの数が 11 であること' do
      expect(OnSheet::Title.count).to eq 11
    end
  end
end
