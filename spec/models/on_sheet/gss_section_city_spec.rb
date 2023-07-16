require 'rails_helper'

RSpec.describe OnSheet::GssSectionCity, type: :model do
  describe 'レコード' do
    it '存在すること' do
      record = OnSheet::GssSectionCity.first

      expect(record).to be_present
    end
  end
end
