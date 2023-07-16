require 'rails_helper'

RSpec.describe GssCharacterToNickname, type: :model do
  describe 'レコード' do
    it '存在すること' do
      record = GssCharacterToNickname.first

      expect(record).to be_present
      expect(record.gss_character).to be_present
      expect(record.nickname).to be_present
    end
  end
end
