module ImportService
  class Character < Base
    def rows # rubocop:disable Metrics/AbcSize
      rows = []

      # 時間が掛かるが順番を優先する
      on_sheet_characters = ::OnSheet::Character.all

      on_sheet_s1_characters = on_sheet_characters.pluck(:s1)
      on_sheet_s1_yomis = on_sheet_characters.pluck(:s1_yomi)
      on_sheet_s1_ens = on_sheet_characters.pluck(:s1_en)
      rows += on_sheet_s1_characters.zip(on_sheet_s1_yomis, on_sheet_s1_ens)

      on_sheet_s2_characters = on_sheet_characters.pluck(:s2)
      on_sheet_s2_yomis = on_sheet_characters.pluck(:s2_yomi)
      on_sheet_s2_ens = on_sheet_characters.pluck(:s2_en)
      rows += on_sheet_s2_characters.zip(on_sheet_s2_yomis, on_sheet_s2_ens)

      on_sheet_s3_characters = on_sheet_characters.pluck(:s3)
      on_sheet_s3_yomis = on_sheet_characters.pluck(:s3_yomi)
      on_sheet_s3_ens = on_sheet_characters.pluck(:s3_en)
      rows += on_sheet_s3_characters.zip(on_sheet_s3_yomis, on_sheet_s3_ens)

      on_sheet_s4_characters = on_sheet_characters.pluck(:s4)
      on_sheet_s4_yomis = on_sheet_characters.pluck(:s4_yomi)
      on_sheet_s4_ens = on_sheet_characters.pluck(:s4_en)
      rows += on_sheet_s4_characters.zip(on_sheet_s4_yomis, on_sheet_s4_ens)

      on_sheet_s5_characters = on_sheet_characters.pluck(:s5)
      on_sheet_s5_yomis = on_sheet_characters.pluck(:s5_yomi)
      on_sheet_s5_ens = on_sheet_characters.pluck(:s5_en)
      rows += on_sheet_s5_characters.zip(on_sheet_s5_yomis, on_sheet_s5_ens)

      on_sheet_tk_characters = on_sheet_characters.pluck(:tk)
      on_sheet_tk_yomis = on_sheet_characters.pluck(:tk_yomi)
      on_sheet_tk_ens = on_sheet_characters.pluck(:tk_en)
      rows += on_sheet_tk_characters.zip(on_sheet_tk_yomis, on_sheet_tk_ens)

      on_sheet_woven_characters = on_sheet_characters.pluck(:woven)
      on_sheet_woven_yomis = on_sheet_characters.pluck(:woven_yomi)
      on_sheet_woven_ens = on_sheet_characters.pluck(:woven_en)
      rows += on_sheet_woven_characters.zip(on_sheet_woven_yomis, on_sheet_woven_ens)

      rows
    end
  end
end
