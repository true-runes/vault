module ImportService
  class Character < Base
    def rows
      on_sheet_gss_characters = ::OnSheet::GssCharacter.all

      # TODO: 「極」からのデータソースを作り、幻水総選挙は別名前空間へ移す
      names = on_sheet_gss_characters.map(&:name)
      # TODO: 名前のデータソースを作る
      name_ens = on_sheet_gss_characters.count.times.map { |_| '' }

      names.zip(name_ens)
    end
  end
end
