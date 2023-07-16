module ImportService
  class Nickname < Base
    def rows
      # columns
      # name

      nickname_records = ::OnSheet::Nickname.all

      nicknames = nickname_records.map do |nickname_record|
        [
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
      end.flatten

      nicknames.uniq.map do |nickname|
        [
          nickname,
        ]
      end
    end
  end
end
