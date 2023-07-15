module ImportService
  module Gss
    class Character < Base
      # headers
      # name

      def rows
        on_sheet_gss_characters = ::OnSheet::GssCharacter.all
        on_sheet_gss_character_names = on_sheet_gss_characters.map(&:name)

        on_sheet_gss_character_names.map do |on_sheet_gss_character_name|
          [
            on_sheet_gss_character_name,
          ]
        end
      end
    end
  end
end
