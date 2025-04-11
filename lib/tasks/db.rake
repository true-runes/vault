# rubocop:disable Metrics/BlockLength
namespace :db do
  desc 'DB をアップデート (UPSERT) する'
  task import_csv: :environment do
    Rake::Task['db:migrate:reset'].invoke if Rails.env.test?

    class_name_to_csv_filepath_map = Vault::ConstantValue.class_name_to_csv_filepath_map

    ActiveRecord::Base.transaction do
      class_name_to_csv_filepath_map.each do |class_name_string, csv_filepath|
        show_message_and_execute_on_construction(class_name_string, csv_filepath)
      end
    end
  end

  desc 'インポータ（OnSheet のデータを元に本テーブルへインポートする）'
  task make_up_db: :environment do
    ActiveRecord::Base.transaction do
      # 順番に意味はある

      puts "[#{Time.zone.now}] ImportService::Star の実行を開始します。"
      ImportService::Star.new.execute
      puts "[#{Time.zone.now}] ImportService::Star の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::CharacterString の実行を開始します。"
      ImportService::CharacterString.new.execute
      puts "[#{Time.zone.now}] ImportService::CharacterString の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::Character の実行を開始します。"
      ImportService::Character.new.execute
      puts "[#{Time.zone.now}] ImportService::Character の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::ProductTitle の実行を開始します。"
      ImportService::ProductTitle.new.execute
      puts "[#{Time.zone.now}] ImportService::ProductTitle の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::Gss::Character の実行を開始します。"
      ImportService::Gss::Character.new.execute
      puts "[#{Time.zone.now}] ImportService::Gss::Character の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::Gss::CharacterToProductTitle の実行を開始します。"
      ImportService::Gss::CharacterToProductTitle.new.execute
      puts "[#{Time.zone.now}] ImportService::Gss::CharacterToProductTitle の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::Nickname の実行を開始します。"
      ImportService::Nickname.new.execute
      puts "[#{Time.zone.now}] ImportService::Nickname の実行が終了しました。"

      puts "[#{Time.zone.now}] ImportService::GssCharacterToNickname の実行を開始します。"
      ImportService::GssCharacterToNickname.new.execute
      puts "[#{Time.zone.now}] ImportService::GssCharacterToNickname の実行が終了しました。"
    end
  end

  desc 'スプレッドシートのデータを CSV としてダウンロードする'
  task download_csv: :environment do
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

def show_message_and_execute_on_construction(class_name_string, csv_filepath)
  puts "[#{Time.zone.now}] #{class_name_string} の実行を開始します。"

  klass = class_name_string.constantize
  klass.new(
    csv_filepath:
  ).execute

  puts "[#{Time.zone.now}] #{class_name_string} の実行が終了しました。"
end
# rubocop:enable Metrics/BlockLength
