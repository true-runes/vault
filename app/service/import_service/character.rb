# rubocop:disable Metrics/BlockLength
module ImportService
  class Character < Base
    NUMBER_OF_SOD = 108

    # columns
    # character_string_id
    # t.integer "star_id", comment: "宿星"
    # t.string "name", default: "", null: false, comment: "キャラ名（「極」に準じ、意味が異なる同名キャラは区別する）"
    # t.string "yomi", default: "", null: false, comment: "キャラ名の読み仮名"
    # t.string "name_en", default: "", null: false, comment: "キャラ名（英語）"

    def rows # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      rows = []
      on_sheet_characters = ::OnSheet::Character.all

      NUMBER_OF_SOD.times do |i|
        # index_number = i + 1
        # on_sheet_character = ::OnSheet::Character.find_by(id: index_number)
        on_sheet_character = on_sheet_characters[i]
        star_name = on_sheet_character.star_attr

        s1_star_name = star_name
        s1_star_foreign_key_id = ::Star.find_by(name: s1_star_name).id
        s1_character = on_sheet_character.s1
        s1_character_str = on_sheet_character.s1_str
        character_string_id = ::CharacterString.find_by(name: s1_character_str).id
        s1_yomi = on_sheet_character.s1_yomi
        s1_en = on_sheet_character.s1_en
        rows << [
          character_string_id,
          s1_star_foreign_key_id,
          s1_character,
          s1_yomi,
          s1_en,
        ]

        s2_star_name = star_name
        s2_star_foreign_key_id = ::Star.find_by(name: s2_star_name).id
        s2_yomi = on_sheet_character.s2_yomi

        s2_character_strs = []
        s2_characters = []
        s2_ens = []

        # 幻水II は一つの宿星に複数のキャラが属す場合がある
        # その場合はシートにカンマ区切りで書いている
        if on_sheet_character.s2.include?(',')
          s2_characters = on_sheet_character.s2.split(',')
          s2_character_strs = on_sheet_character.s2_str.split(',')
          s2_ens = on_sheet_character.s2_en.split(',')
        else
          s2_characters = [on_sheet_character.s2]
          s2_character_strs = [on_sheet_character.s2_str]
          s2_ens = [on_sheet_character.s2_en]
        end

        s2_characters.count.times do |j|
          s2_character_str = s2_character_strs[j]
          s2_character = s2_characters[j]
          s2_en = s2_ens[j]
          character_string_id = ::CharacterString.find_by(name: s2_character_str).id

          rows << [
            character_string_id,
            s2_star_foreign_key_id,
            s2_character,
            s2_yomi,
            s2_en,
          ]
        end

        s3_star_name = star_name
        s3_star_foreign_key_id = ::Star.find_by(name: s3_star_name).id
        s3_character = on_sheet_character.s3
        s3_character_str = on_sheet_character.s3_str
        character_string_id = ::CharacterString.find_by(name: s3_character_str).id
        s3_yomi = on_sheet_character.s3_yomi
        s3_en = on_sheet_character.s3_en
        rows << [
          character_string_id,
          s3_star_foreign_key_id,
          s3_character,
          s3_yomi,
          s3_en,
        ]

        s4_star_name = star_name
        s4_star_foreign_key_id = ::Star.find_by(name: s4_star_name).id
        s4_character = on_sheet_character.s4
        s4_character_str = on_sheet_character.s4_str
        character_string_id = ::CharacterString.find_by(name: s4_character_str).id
        s4_yomi = on_sheet_character.s4_yomi
        s4_en = on_sheet_character.s4_en
        rows << [
          character_string_id,
          s4_star_foreign_key_id,
          s4_character,
          s4_yomi,
          s4_en,
        ]

        s5_star_name = star_name
        s5_star_foreign_key_id = ::Star.find_by(name: s5_star_name).id
        s5_character = on_sheet_character.s5
        s5_character_str = on_sheet_character.s5_str
        character_string_id = ::CharacterString.find_by(name: s5_character_str).id
        s5_yomi = on_sheet_character.s5_yomi
        s5_en = on_sheet_character.s5_en
        rows << [
          character_string_id,
          s5_star_foreign_key_id,
          s5_character,
          s5_yomi,
          s5_en,
        ]

        tk_star_name = star_name
        tk_star_foreign_key_id = ::Star.find_by(name: tk_star_name).id
        tk_character = on_sheet_character.tk
        tk_character_str = on_sheet_character.tk_str
        character_string_id = ::CharacterString.find_by(name: tk_character_str).id
        tk_yomi = on_sheet_character.tk_yomi
        tk_en = on_sheet_character.tk_en
        rows << [
          character_string_id,
          tk_star_foreign_key_id,
          tk_character,
          tk_yomi,
          tk_en,
        ]

        woven_star_name = star_name
        woven_star_foreign_key_id = ::Star.find_by(name: woven_star_name).id
        woven_character = on_sheet_character.woven
        woven_character_str = on_sheet_character.woven_str
        character_string_id = ::CharacterString.find_by(name: woven_character_str).id
        woven_yomi = on_sheet_character.woven_yomi
        woven_en = on_sheet_character.woven_en
        rows << [
          character_string_id,
          woven_star_foreign_key_id,
          woven_character,
          woven_yomi,
          woven_en,
        ]
      end

      # 複数作品に出ているキャラをまとめる
      # 基準は [2] の要素である「キャラ名」になる（NOTE: カラム修正時に注意）
      # group_by で key に row[1] 、 value に row を持つハッシュを作る
      # そして map で value の最初の要素を取り出す（全ての value が等しいという前提）
      # #first なのでその時点で uniq と同等になる
      rows.group_by { |row| row[2] }.map do |_, row|
        row.first
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
