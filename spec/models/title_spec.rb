require 'rails_helper'

RSpec.describe Title, type: :model do
  describe 'Title クラス' do
    it 'タイトルの数が 11 であること' do
      expect(Title.count).to eq 11
    end
  end
end
