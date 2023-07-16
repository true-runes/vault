module ImportService
  class GssCharacterToNickname < Base
    def rows
      # columns
      # gss_character_id
      # nickname_id

      rows = []
      nickname_records = ::OnSheet::Nickname.all

      nickname_records.each do |nickname_record|
        gss_character_name = nickname_record.name
        gss_character_id = ::Gss::Character.find_by(name: gss_character_name).id

        nicknames = [
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
        ].compact_blank

        nicknames.each do |nickname|
          next if nickname == gss_character_name

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
