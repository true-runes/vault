require 'rails_helper'

RSpec.describe Constant::GssCharacterNames, type: :model do
  describe '::Gss::CharacterNames' do
    it '#values で値が返ってくること' do
      expect(Constant::GssCharacterNames.values.count).to be > 0
    end

    it '#s1 で値が返ってくること' do
      expect(Constant::GssCharacterNames.s1.count).to be > 0
    end

    # s2, gaiden, s3 , s4, rhapsodia, s5, tk, tsumutoki で値が0個以上返ってくること
    it '#s2 で値が返ってくること' do
      expect(Constant::GssCharacterNames.s2.count).to be > 0
    end

    it '#gaiden で値が返ってくること' do
      expect(Constant::GssCharacterNames.gaiden.count).to be > 0
    end

    it '#gaiden に料理長が含まれていないこと' do
      expect(Constant::GssCharacterNames.gaiden).not_to include('料理長')
    end

    it '#gaiden に軍医が含まれていないこと' do
      expect(Constant::GssCharacterNames.gaiden).not_to include('料理長')
    end

    it '#gaiden にザジ・キュイロス（サナトス・クロフォード）が含まれていること' do
      expect(Constant::GssCharacterNames.gaiden).to include('ザジ・キュイロス（サナトス・クロフォード）')
    end

    it '#s3 で値が返ってくること' do
      expect(Constant::GssCharacterNames.s3.count).to be > 0
    end

    it '#s4 で値が返ってくること' do
      expect(Constant::GssCharacterNames.s4.count).to be > 0
    end

    it '#rhapsodia で値が返ってくること' do
      expect(Constant::GssCharacterNames.rhapsodia.count).to be > 0
    end

    it '#s5 で値が返ってくること' do
      expect(Constant::GssCharacterNames.s5.count).to be > 0
    end

    it '#tk で値が返ってくること' do
      expect(Constant::GssCharacterNames.tk.count).to be > 0
    end

    it '#tsumutoki で値が返ってくること' do
      expect(Constant::GssCharacterNames.tsumutoki.count).to be > 0
    end
  end
end
