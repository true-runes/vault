namespace :db do
  namespace :reconstruction do
    desc 'DB を壊して最初から作り直す'
    task execute: :environment do
      Rake::Task['db:migrate:reset'].invoke

      ActiveRecord::Base.transaction do
        # sheet_id の map は app/service/spreadsheet_service/sheet_id.rb に記述している
        puts "[#{Time.zone.now}] ImportService::Star の実行を開始します。"
        ImportService::Star.new(
          csv_filepath: Rails.root.join('db/csv/basic_attributes/stars.csv')
        ).execute
        puts "[#{Time.zone.now}] ImportService::Star の実行が終了しました。"

        puts "[#{Time.zone.now}] ImportService::Title の実行を開始します。"
        ImportService::Title.new(
          csv_filepath: Rails.root.join('db/csv/products/titles.csv')
        ).execute
        puts "[#{Time.zone.now}] ImportService::Title の実行が終了しました。"

        # 時間がかかるようになったら条件によってインポートをスキップするロジックを組み込む
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
