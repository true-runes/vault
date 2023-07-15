require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'ルック' do
    let(:luc_records) { Character.where(name: 'ルック') }

    it '名前があること' do
      expect(luc_records).to be_present
    end

    it '名前は一つだけ存在すること' do
      expect(luc_records.size).to eq 1
    end
  end

  describe '間違えやすいキャラ' do
    it '"ジークフリート" は存在しないこと' do
      expect(Character.where(name: 'ジークフリート')).to be_blank
    end

    it '"ウインドウ" が存在すること' do
      expect(Character.where(name: 'ウインドウ')).to be_present
    end
  end

  describe '"アビズボア,フェザー,ジークフリード"' do
    it 'まとめたレコードが記録されていないこと' do
      expect(Character.where(name: 'アビズボア,フェザー,ジークフリード')).to be_blank
    end

    it 'アビズボア が一つのレコードとして記録されていること' do
      expect(Character.find_by(name: 'アビズボア')).to be_present
      expect(Character.where(name: 'アビズボア').size).to eq 1
    end

    it 'フェザー が一つのレコードとして記録されていること' do
      expect(Character.find_by(name: 'フェザー')).to be_present
      expect(Character.where(name: 'フェザー').size).to eq 1
    end

    it 'ジークフリード が一つのレコードとして記録されていること' do
      expect(Character.find_by(name: 'ジークフリード')).to be_present
      expect(Character.where(name: 'ジークフリード').size).to eq 1
    end
  end
end
