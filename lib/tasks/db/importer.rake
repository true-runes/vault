namespace :db do
  namespace :importer do
    desc 'インポータ（データソースのインポートはスコープ外）'
    task execute: :environment do
      ActiveRecord::Base.transaction do
        show_message_and_execute_on_importer('Character')
        show_message_and_execute_on_importer('Star')
      end
    end
  end
end

def show_message_and_execute_on_importer(class_name_string)
  puts "[#{Time.zone.now}] #{class_name_string} の実行を開始します。"

  `bundle exec rails runner "ImportService::#{class_name_string}.new.execute"`

  puts "[#{Time.zone.now}] #{class_name_string} の実行が終了しました。"
end
