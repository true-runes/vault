require 'rails_helper'

RSpec.describe Constant::GssCharacterNames, type: :model do
  describe '::Gss::CharacterNames' do
    it '#values で値が返ってくること' do
      expect(Constant::GssCharacterNames.values.count).to be > 0
    end
  end
end
