module ImportService
  class GssCharacterToNickname < Base
    def rows
      # columns
      # gss_character_id
      # nickname_id

      rows = []
      nickname_records = ::OnSheet::Nickname.all

      nickname_records.each do |nickname_record|
        # nicknames シートの name 列の値で一致を判定している
        gss_character_name = nickname_record.name
        gss_character_id = ::Gss::Character.find_by(name: gss_character_name).id

        nicknames = [
          nickname_record.nickname_00,
          nickname_record.nickname_01,
          nickname_record.nickname_02,
          nickname_record.nickname_03,
          nickname_record.nickname_04,
          nickname_record.nickname_05,
          nickname_record.nickname_06,
          nickname_record.nickname_07,
          nickname_record.nickname_08,
          nickname_record.nickname_09,
          nickname_record.nickname_10,
          nickname_record.nickname_11,
          nickname_record.nickname_12,
          nickname_record.nickname_13,
          nickname_record.nickname_14,
          nickname_record.nickname_15,
          nickname_record.nickname_16,
        ].uniq.compact_blank

        # nickname と gss_character_name が同じでも OK とする
        # nickname は「呼び名」の意なので
        nicknames.each do |nickname|
          # ::Nickname は name だけをカラムに持つ
          nickname_id = ::Nickname.find_by(name: nickname).id

          rows << [
            gss_character_id,
            nickname_id,
          ]
        end
      end

      rows
    end
  end
end
