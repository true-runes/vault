require 'rails_helper'

RSpec.describe ProductTitle, type: :model do
  describe 'レコード' do
    it '期待どおりであること' do
      expect(ProductTitle.count).to eq 11

      expect(ProductTitle.pluck(:name)).to match_array(
        [
          '幻想水滸伝',
          '幻想水滸伝II',
          '幻想水滸伝III',
          '幻想水滸伝IV',
          '幻想水滸伝V',
          '幻想水滸外伝Vol.1',
          '幻想水滸外伝Vol.2',
          'Rhapsodia',
          '幻想水滸伝ティアクライス',
          '幻想水滸伝 紡がれし百年の時',
          '幻想水滸伝 カードストーリーズ',
        ]
      )
    end
  end
end
