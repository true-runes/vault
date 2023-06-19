namespace :db do
  namespace :download_csv do
    desc 'スプレッドシートのデータを CSV としてダウンロードする'
    task execute: :environment do
      worksheets_on_id = YAML.load_file(
        ENV.fetch('SPREADSHEET_TITLE_TO_ID_MAP_FILEPATH', nil)
      )

      worksheets_on_id.each do |sheet_name, value|
        value['worksheet_names'].each do |worksheet_name|
          DownloadCsvService.new(
            spreadsheet_id: value['id'],
            worksheet_name:
          ).execute(
            Rails.root.join("db/csv/#{sheet_name}/#{worksheet_name}.csv")
          )
        end
      end
    end
  end
end
