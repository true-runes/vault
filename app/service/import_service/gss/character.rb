module ImportService
  module Gss
    class Character < Base
      def rows
        on_sheet_gss_characters = ::OnSheet::GssCharacter.all
        on_sheet_gss_character_names = on_sheet_gss_characters.map do |character|
          if character.sosenkyo_name.present?
            character.sosenkyo_name
          else
            character.name
          end
        end

        on_sheet_gss_character_names.map do |on_sheet_gss_character_name|
          [
            on_sheet_gss_character_name,
          ]
        end
      end
    end
  end
end
