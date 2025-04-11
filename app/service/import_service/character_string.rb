module ImportService
  class CharacterString < Base
    def rows
      on_sheet_s1_character_strs = ::OnSheet::Character.pluck(:s1_str)

      on_sheet_s2_character_strs = ::OnSheet::Character.pluck(:s2_str)

      on_sheet_s2_character_strs_filtered = []
      on_sheet_s2_character_strs.each do |s2_character_str|
        if s2_character_str.include?(',')
          s2_character_str.split(',').each do |split_s2_character_str|
            on_sheet_s2_character_strs_filtered << split_s2_character_str
          end
        else
          on_sheet_s2_character_strs_filtered << s2_character_str
        end
      end.flatten

      on_sheet_s3_character_strs = ::OnSheet::Character.pluck(:s3_str)
      on_sheet_s4_character_strs = ::OnSheet::Character.pluck(:s4_str)
      on_sheet_s5_character_strs = ::OnSheet::Character.pluck(:s5_str)
      on_sheet_tk_character_strs = ::OnSheet::Character.pluck(:tk_str)
      on_sheet_woven_character_strs = ::OnSheet::Character.pluck(:woven_str)

      all_character_strings = on_sheet_s1_character_strs +
                              on_sheet_s2_character_strs_filtered +
                              on_sheet_s3_character_strs +
                              on_sheet_s4_character_strs +
                              on_sheet_s5_character_strs +
                              on_sheet_tk_character_strs +
                              on_sheet_woven_character_strs

      all_character_strings.map do |character_string|
        [
          character_string,
        ]
      end.uniq
    end
  end
end
