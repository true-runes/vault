require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Character, type: :model do
  describe '特定キャラ' do
    it '#name に "ゴードン" というキャラは存在しないこと' do
      expect(Character.where(name: 'ゴードン')).to be_blank
    end

    it '#name に "ゴードン（幻想水滸伝II）" というキャラが存在すること' do
      expect(Character.where(name: 'ゴードン（幻想水滸伝II）')).to be_present
    end

    it '#name に "ゴードン（幻想水滸伝III）" というキャラが存在すること' do
      expect(Character.where(name: 'ゴードン（幻想水滸伝III）')).to be_present
    end
  end

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

  describe '"ゲオルグ"' do
    it 'レコードは存在しないこと' do
      expect(Character.find_by(name: 'ゲオルグ')).to be_blank
    end
  end

  describe '"ゲオルグ・プライム"' do
    it '一つのレコードとして記録されていること' do
      expect(Character.find_by(name: 'ゲオルグ・プライム')).to be_present
      expect(Character.where(name: 'ゲオルグ・プライム').size).to eq 1
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
# rubocop:enable Metrics/BlockLength
