namespace :db do
  namespace :download_csv do
    desc 'スプレッドシートのデータを CSV としてダウンロードする'
    task execute: :environment do
      worksheets_on_id = YAML.load_file(
        ENV.fetch('SPREADSHEET_TITLE_TO_ID_MAP_FILEPATH', nil)
      )

      worksheets_on_id.each do |sheet_name, value|
        value['worksheet_names'].each do |worksheet_name|
          this_spreadsheet_id = FileService.eval_plain_env_or_plain_text_variable(
            value['id']
          )

          DownloadCsvService.new(
            spreadsheet_id: this_spreadsheet_id,
            worksheet_name:
          ).execute(
            Rails.root.join("db/csv_on_sheet/#{sheet_name}/#{worksheet_name}.csv")
          )
        end
      end
    end
  end
end
