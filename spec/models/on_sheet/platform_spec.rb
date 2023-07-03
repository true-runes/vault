require 'rails_helper'

RSpec.describe OnSheet::Platform, type: :model do
  describe 'OnSheet::Platform クラス' do
    it 'レコードの数が 10 であること' do
      on_sheet_platforms = OnSheet::Platform.all

      # 囲む
      aggregate_failures do
        expect(on_sheet_platforms.count).to eq 9
        expect(on_sheet_platforms.map(&:name)).to include 'PlayStation'
      end
    end
  end
end
