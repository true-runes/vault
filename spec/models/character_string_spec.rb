require 'rails_helper'

RSpec.describe CharacterString, type: :model do
  describe 'ゴードン' do
    it 'Character を 2つ 子レコード として持つこと' do
      g = CharacterString.find_by(name: 'ゴードン')

      expect(g.characters.size).to eq 2
      expect(g.characters.pluck(:name)).to match_array [
        'ゴードン（幻想水滸伝II）',
        'ゴードン（幻想水滸伝III）',
      ]
    end
  end

  describe 'Character との違い' do
    it 'Character と CharacterString 数の差は 1 で「ゴードン」の分だけ String が少ない' do
      expect(Character.all.size - CharacterString.all.size).to eq 1
    end
  end
end
