require 'rails_helper'

RSpec.describe Gss::CharacterToProductTitle, type: :model do
  describe 'レコード' do
    it '存在すること' do
      record = Gss::CharacterToProductTitle.first

      expect(record).to be_present
      expect(record.gss_character).to be_present
      expect(record.product_title).to be_present
    end
  end
end
