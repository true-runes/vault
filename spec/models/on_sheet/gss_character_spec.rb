require 'rails_helper'

RSpec.describe OnSheet::GssCharacter, type: :model do
  describe 'OnSheet::GssCharacter クラス' do
    it '"ゴードン" が 2人 いること' do
      characters = OnSheet::GssCharacter.where(name: 'ゴードン')

      expect(characters.count).to eq 2
    end

    it '"名前" が "ルセリナ" のキャラは "総選挙での名前" が "ルセリナ・ゴードン" であること' do
      character = OnSheet::GssCharacter.find_by(name: 'ルセリナ')

      expect(character.gensosenkyo_name).to eq 'ルセリナ・バロウズ'
    end
  end
end
