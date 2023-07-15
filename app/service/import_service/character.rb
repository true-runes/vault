module ImportService
  class Character < Base
    NUMBER_OF_SOD = 108

    def rows # rubocop:disable Metrics/AbcSize
      rows = []

      NUMBER_OF_SOD.times do |i|
        index_number = i + 1
        on_sheet_character = ::OnSheet::Character.find_by(id: index_number)

        s1_star_name = on_sheet_character.star_attr
        s1_star_foreign_key_id = ::Star.find_by(name: s1_star_name).id
        s1_character = on_sheet_character.s1
        s1_yomi = on_sheet_character.s1_yomi
        s1_en = on_sheet_character.s1_en
        rows << [s1_star_foreign_key_id, s1_character, s1_yomi, s1_en]

        s2_star_name = on_sheet_character.star_attr
        s2_star_foreign_key_id = ::Star.find_by(name: s2_star_name).id
        s2_yomi = on_sheet_character.s2_yomi
        s2_en = on_sheet_character.s2_en
        # 幻水II は一つの宿星に複数のキャラが属す場合がある
        # その場合はシートにカンマ区切りで書いている
        on_sheet_s2_characters = on_sheet_character.s2
        s2_characters = if on_sheet_s2_characters.include?(',')
                          on_sheet_s2_characters.split(',')
                        else
                          [on_sheet_s2_characters]
                        end

        s2_characters.each do |s2_character|
          rows << [s2_star_foreign_key_id, s2_character, s2_yomi, s2_en]
        end

        s3_star_name = on_sheet_character.star_attr
        s3_star_foreign_key_id = ::Star.find_by(name: s3_star_name).id
        s3_character = on_sheet_character.s3
        s3_yomi = on_sheet_character.s3_yomi
        s3_en = on_sheet_character.s3_en
        rows << [s3_star_foreign_key_id, s3_character, s3_yomi, s3_en]

        s4_star_name = on_sheet_character.star_attr
        s4_star_foreign_key_id = ::Star.find_by(name: s4_star_name).id
        s4_character = on_sheet_character.s4
        s4_yomi = on_sheet_character.s4_yomi
        s4_en = on_sheet_character.s4_en
        rows << [s4_star_foreign_key_id, s4_character, s4_yomi, s4_en]

        s5_star_name = on_sheet_character.star_attr
        s5_star_foreign_key_id = ::Star.find_by(name: s5_star_name).id
        s5_character = on_sheet_character.s5
        s5_yomi = on_sheet_character.s5_yomi
        s5_en = on_sheet_character.s5_en
        rows << [s5_star_foreign_key_id, s5_character, s5_yomi, s5_en]

        tk_star_name = on_sheet_character.star_attr
        tk_star_foreign_key_id = ::Star.find_by(name: tk_star_name).id
        tk_character = on_sheet_character.tk
        tk_yomi = on_sheet_character.tk_yomi
        tk_en = on_sheet_character.tk_en
        rows << [tk_star_foreign_key_id, tk_character, tk_yomi, tk_en]

        woven_star_name = on_sheet_character.star_attr
        woven_star_foreign_key_id = ::Star.find_by(name: woven_star_name).id
        woven_character = on_sheet_character.woven
        woven_yomi = on_sheet_character.woven_yomi
        woven_en = on_sheet_character.woven_en
        rows << [woven_star_foreign_key_id, woven_character, woven_yomi, woven_en]
      end

      rows
    end
  end
end
