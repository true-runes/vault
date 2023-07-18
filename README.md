# Vault
- Suikoden series' "Vault, Storage or Warehouse."

# スプレッドシートを変更したら変えなければならないところ
- db:migrate
- OnSheet の Importer
- データの Importer

# インポートの手順

#### 1. YAML を編集
- `config/spreadsheet/worksheets_on_id.yml`

#### 2. CSV に書き出すタスクを実行する
- `db/csv_on_sheet` 配下に CSVファイル が保存されていく

```bash
$ bundle exec rails db:download_csv
```

#### 3. 「2.」で得られたCSV をデータソースとするインポートタスクを実行する
- 実際の中身は `app/service` 配下のクラスである
- インポートされるファイルは明示的に記述する必要がある
  - `config/initializers/constant_value.rb`
- インポートが正常に完了すると `db` 配下に ER図 が生成される
- `OnSheet::` 名前空間のテーブルが作られる
  - `OnSheet::Star`
  - `OnSheet::Title`
  - `OnSheet::Platform`
- 冪等なので何回実行しても同じであるし、更新があれば更新される
  - CSV が更新されたら以下の手順を踏む必要がある
    - CSV ダウンロード -> (db:migrate) -> CSV インポート -> DB メイクアップ

```bash
# 必要に応じて DB をまっさらにする
# $ bundle exec rails db:migrate:reset
$ bundle exec rails db:import_csvs
```

#### 4. 「3.」でインポートされた DB を用いて ActiveRecord を用いて正式 DB を構成する

```bash
$ bundle exec rails db:make_up_db
```

# Tips

### A. CLI でスプレッドシートのデータを取得する方法
以下のコマンドを実行する。

```bash
$ bundle exec rails runner "o = FetchDataTableService::FromSpreadsheet.new(spreadsheet_id: SPREADSHEET_ID, worksheet_name: WORKSHEET_NAME); o.headers; o.rows; o.header_to_rows"
```

あるいはコンソールで以下のようにする。

```ruby
irb> o = FetchDataTableService::FromSpreadsheet.new(spreadsheet_id: SPREADSHEET_ID, worksheet_name: WORKSHEET_NAME) # ログは hoge; nil; では出てしまう
irb> o.headers
irb> o.rows
irb> o.header_to_rows
```

一番良いのはもちろん **テストを書くこと** 。

### B. 新規スプレッドシートの取り込み方法
- シートのID と ワークシートの名前 を取得する
  - スプレッドシートの条件は以下の2つ
    - ワークシートの名前およびカラムの名前が英数字であること
    - 一番左に id列 をもつこと
- ワークシートの共有アドレスに creds のアドレスを追加する
  - 全世界公開だと不要だが、原則入れる癖をつける
- シートのID と ワークシートの名前 を 環境変数 と YAML に書く
- モデルを作成する
- マイグレーションを行う
  - 制約は緩くていい
- インポータを書く
  - 実際は Base の継承だけでいいので中身は書く必要はない
  - ファイル名とクラス名を規約に沿わす
- Rake タスクにインポータを追記する
- 一括実行スクリプトでインポートする
- できればテストを書く
