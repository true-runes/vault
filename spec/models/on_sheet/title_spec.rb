require 'rails_helper'

RSpec.describe OnSheet::Title, type: :model do
  describe 'OnSheet::Title クラス' do
    it 'タイトルの数が 11 であること' do
      sheet_titles = OnSheet::Title.all

      expect(sheet_titles.count).to eq 11
    end
  end
end
