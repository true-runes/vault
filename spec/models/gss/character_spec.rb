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

  describe 'キャラが作品に属する' do
    it 'ルック が 幻水I, II and III に属すること' do
      character = Gss::Character.find_by(name: 'ルック')

      expect(character.product_titles.map(&:name)).to match_array %w[
        幻想水滸伝
        幻想水滸伝II
        幻想水滸伝III
      ]
    end

    it 'ハーン・カニンガム が 幻水II に属すること' do
      character = Gss::Character.find_by(name: 'ハーン・カニンガム')

      expect(character.product_titles.map(&:name)).to match_array %w[幻想水滸伝II]
    end

    it 'コノン が 幻想水滸伝ティアクライス に属すること' do
      character = Gss::Character.find_by(name: 'コノン')

      expect(character.product_titles.map(&:name)).to match_array %w[幻想水滸伝ティアクライス]
    end
  end
end
