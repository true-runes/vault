require 'rails_helper'

RSpec.describe Gss::Character, type: :model do
  describe 'キャラ数' do
    it 'すべてユニークなキャラであること' do
      expect(Gss::Character.all.count).to eq Gss::Character.all.distinct.count
    end
  end
end
