namespace :db do
  namespace :importer do
    desc 'インポータ（OnSheet のデータを元に本テーブルへインポートする）'
    task execute: :environment do
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
  end
end
