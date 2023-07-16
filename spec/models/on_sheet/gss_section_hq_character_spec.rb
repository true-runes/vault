require 'rails_helper'

RSpec.describe OnSheet::GssSectionHqCharacter, type: :model do
  describe 'レコード' do
    it '存在すること' do
      record = OnSheet::GssSectionHqCharacter.first

      expect(record).to be_present
    end
  end
end
