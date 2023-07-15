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

  xdescribe '"アビズボア,フェザー,ジークフリート"' do
    it '分割されて記録されていること' do
      expect(1 + 1).to eq 2
    end
  end
end
