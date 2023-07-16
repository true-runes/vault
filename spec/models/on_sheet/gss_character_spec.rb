require 'rails_helper'

RSpec.describe OnSheet::GssCharacter, type: :model do
  describe 'OnSheet::GssCharacter クラス' do
    it '"ゴードン" 以外はすべてユニークなキャラであること' do
      expect(OnSheet::GssCharacter.all.size).to eq OnSheet::GssCharacter.all.map(&:name).uniq.size + 1
    end

    it '"ゴードン" が 2人 いること' do
      characters = OnSheet::GssCharacter.where(name: 'ゴードン')

      expect(characters.count).to eq 2
    end

    it '"名前" が "ルセリナ" のキャラは "総選挙での名前" が "ルセリナ・ゴードン" であること' do
      character = OnSheet::GssCharacter.find_by(name: 'ルセリナ')

      expect(character.sosenkyo_name).to eq 'ルセリナ・バロウズ'
    end

    it '"名前" が "ゴンボスレン" のキャラがいること' do
      character = OnSheet::GssCharacter.find_by(name: 'ゴンボスレン')

      expect(character).not_to be_nil
    end

    it '"名前" が "ゴンポスレン" のキャラ (typo) はいないこと' do
      character = OnSheet::GssCharacter.find_by(name: 'ゴンポスレン')

      expect(character).to be_nil
    end
  end
end
