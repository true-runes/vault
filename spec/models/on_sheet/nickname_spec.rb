require 'rails_helper'

RSpec.describe OnSheet::Nickname, type: :model do
  describe 'レコード' do
    it '存在すること' do
      expect(Nickname.where(name: '坊ちゃん')).to be_present
      expect(Nickname.where(name: '熊さん')).to be_present
    end
  end
end
