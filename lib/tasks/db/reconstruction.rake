namespace :db do
  namespace :reconstruction do
    desc 'DB を壊して最初から作り直す'
    task execute: :environment do
      Rake::Task['db:migrate:reset'].invoke

      # 時間がかかるようになったらこのあたりにスキップするロジックを組み込む
      # Rake::Task['importer:foo:bar'].invoke
      # Rake::Task['importer:hoge:fuga'].invoke
      # Rake::Task['importer:piyo:puyo'].invoke

      # ERD を出力する
      # db/erd.dot に diff があれば pdf で書き出す
      # `bundle exec erd --filetype=dot`
      # if [ -n "$(git diff --name-only db/erd.dot)" ]; then
      #   `dot -Tpdf db/erd.dot -o db/erd.pdf`
      #   `pdftoppm -png -singlefile db/erd.pdf db/erd`
      # fi
    end
  end
end
