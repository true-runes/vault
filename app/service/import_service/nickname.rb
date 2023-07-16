module ImportService
  class Nickname < Base
    def rows
      character_names = ::OnSheet::GssCharacter.pluck(:キャラ名)
      binding.irb
    end
  end
end
