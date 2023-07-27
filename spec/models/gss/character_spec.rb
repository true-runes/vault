require 'rails_helper'

RSpec.describe Gss::Character, type: :model do
  describe 'キャラ数' do
    it 'すべてユニークなキャラであること' do
      expect(Gss::Character.all.count).to eq Gss::Character.all.distinct.count
    end
  end

  describe 'キャラ' do
    it '"ジョーカー" という名前が含まれるキャラは 1人 だけであること' do
      expect(Gss::Character.where('name like ?', '%ジョーカー%').count).to eq 1
    end

    it '"ジョーカー（ワン）" という名前のキャラが存在すること' do
      expect(Gss::Character.where(name: 'ジョーカー（ワン）')).to be_present
    end

    it '"ザジ・キュイロス（サナトス・クロフォード）" という名前のキャラが存在すること' do
      expect(Gss::Character.where(name: 'ザジ・キュイロス（サナトス・クロフォード）')).to be_present
    end

    it '"ナッシュ・ラトキエ（ナッシュ・クロービス）" という名前のキャラが存在すること' do
      expect(Gss::Character.where(name: 'ナッシュ・ラトキエ（ナッシュ・クロービス）')).to be_present
    end
  end
end
