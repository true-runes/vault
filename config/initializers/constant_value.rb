module Vault
  class ConstantValue
    class << self
      def class_name_to_csv_filepath_map
        {
          'ImportService::OnSheet::Star' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/basic_attributes/stars.csv')
          ),
          'ImportService::OnSheet::Title' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/products/titles.csv')
          ),
          'ImportService::OnSheet::Platform' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/basic_attributes/platforms.csv')
          ),
          'ImportService::OnSheet::GssSectionHqCharacter' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/gss_hq_characters_section/web_format_data.csv')
          ),
          'ImportService::OnSheet::GssSectionCity' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/gss_cities_section/web_format_data.csv')
          ),
          'ImportService::OnSheet::GssCharacter' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/gss_character/web_format_data.csv')
          ),
          'ImportService::OnSheet::Character' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/characters/bases.csv')
          ),
          'ImportService::OnSheet::Nickname' => Rails.root.join(
            Rails.root.join('db/csv_on_sheet/characters/nicknames.csv')
          )
        }
      end
    end
  end
end
