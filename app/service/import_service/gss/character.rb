module ImportService
  module Gss
    class Character
      def execute
        on_sheet_gss_characters = ::OnSheet::GssCharacter.all
        names = on_sheet_gss_characters.map(&:name)
        sosenkyo_names = on_sheet_gss_characters.map(&:sosenkyo_name)

        gss_characters = []

        names.zip(sosenkyo_names).each do |name, sosenkyo_name|
          next if sosenkyo_name.blank?

          gss_characters << ::Gss::Character.new(
            name:,
            sosenkyo_name:
          )
        end

        ::Gss::Character.import!(gss_characters)
      end
    end
  end
end
