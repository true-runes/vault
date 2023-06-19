module SpreadsheetService
  class SheetId
    class << self
      # 新規追加時はシートへの権限の付与も忘れないこと
      def title_to_id(title)
        title_to_id_map.fetch(title)
      end

      def title_to_id_map
        worksheets_on_id = YAML.load_file(
          Rails.root.join(ENV.fetch('SPREADSHEET_TITLE_TO_ID_MAP_FILEPATH', nil))
        )

        {}.tap do |hash|
          worksheets_on_id.each do |key, value|
            # YAML から "ENV['hoge']" という「文字列」で渡ってくることがある
            hash[key] = FileService.eval_plain_env_or_plain_text_variable(value['id'])
          end
        end
      end
    end
  end
end
