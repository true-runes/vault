require 'rails_helper'

RSpec.describe Title, type: :model do
  describe 'Title クラス' do
    it 'クラス名が class であること' do
      expect(Title).to be_a Class
    end
  end
end
