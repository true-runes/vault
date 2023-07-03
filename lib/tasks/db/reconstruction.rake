namespace :db do
  namespace :reconstruction do
    desc 'DB を壊して最初から作り直す'
    task execute: :environment do
      Rake::Task['db:migrate:reset'].invoke

      class_name_to_csv_filepath_map = {
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
        )
      }

      ActiveRecord::Base.transaction do
        class_name_to_csv_filepath_map.each do |class_name_string, csv_filepath|
          show_message_and_execute(class_name_string, csv_filepath)
        end
      end

      # ERD を出力する
      `bundle exec erd --filetype=dot`

      # db/erd.dot に diff があれば pdf を更新する
      diff_names = `git diff --name-only db/erd.dot`
      if diff_names.present?
        puts "[#{Time.zone.now}] db/erd.dot に変更があったので db/erd.(pdf|png) を更新します。"

        `dot -Tpdf db/erd.dot -o db/erd.pdf`
        `pdftoppm -png -singlefile db/erd.pdf db/erd`

        puts "[#{Time.zone.now}] db/erd.dot に変更があったので db/erd.(pdf|png) を更新しました。"
      end
    end
  end
end

def show_message_and_execute(class_name_string, csv_filepath)
  puts "[#{Time.zone.now}] #{class_name_string} の実行を開始します。"

  klass = class_name_string.constantize
  klass.new(
    csv_filepath:
  ).execute

  puts "[#{Time.zone.now}] #{class_name_string} の実行が終了しました。"
end
