require 'rails_helper'

RSpec.describe Nickname, type: :model do
  describe '特定のニックネーム' do
    it '特定のキャラクターに紐づいていること' do
      nickname = Nickname.find_by(name: '坊ちゃん')

      aggregate_failures do
        expect(nickname.gss_characters).to be_present
        expect(nickname.gss_characters.count).to eq 1
        expect(nickname.gss_characters.count).to eq 1
        expect(nickname.gss_characters.first.name).to eq '幻水1主人公（坊ちゃん）'
      end
    end
  end
end
