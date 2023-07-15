namespace :db do
  namespace :construction do
    desc 'DB を壊して最初から作り直す'
    task execute: :environment do
      Rake::Task['db:migrate:reset'].invoke if Rails.env.development? || Rails.env.test?

      class_name_to_csv_filepath_map = Vault::ConstantValue.class_name_to_csv_filepath_map

      ActiveRecord::Base.transaction do
        class_name_to_csv_filepath_map.each do |class_name_string, csv_filepath|
          show_message_and_execute_on_construction(class_name_string, csv_filepath)
        end
      end

      # 以下、CSVをもとにして本データベースを作成していく
      ImportService::Gss::Character.new.execute

      output_erd if Rails.env.development?
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

def output_erd
  # ERD を出力する
  `bundle exec erd --filetype=dot`

  # db/erd.dot に diff があれば pdf を更新する
  diff_names = `git diff --name-only db/erd.dot`
  return unless diff_names.present?

  puts "[#{Time.zone.now}] db/erd.dot に変更があったので db/erd.(pdf|png) を更新します。"

  `dot -Tpdf db/erd.dot -o db/erd.pdf`
  `pdftoppm -png -singlefile db/erd.pdf db/erd`

  puts "[#{Time.zone.now}] db/erd.dot に変更があったので db/erd.(pdf|png) を更新しました。"
end
