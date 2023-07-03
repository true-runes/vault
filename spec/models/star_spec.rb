require 'rails_helper'

RSpec.describe Star, type: :model do
  describe 'Star クラス' do
    it 'クラス名が class であること' do
      expect(Star).to be_a Class
    end
  end
end
