# Vault
- Suikoden series' "Vault, Storage or Warehouse."

# インポートの手順

#### 1. YAML を編集
- `config/spreadsheet/worksheets_on_id.yml`

#### 2. CSV に書き出すタスクを実行する
- `db/csv_on_sheet` 配下に CSVファイル が保存されていく

```bash
$ bundle exec rails db:download_csv:execute
```

#### 3. 「2.」で得られたCSV をデータソースとするインポートタスクを実行する
- 実際の中身は `app/service` 配下のクラスである
- インポートが正常に完了すると `db` 配下に ER図 が生成される

```bash
$ bundle exec rails db:reconstruction:execute
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
- それぞれを 環境変数 と YAML に書く
- モデルを作成する
- マイグレーションを行う
  - 制約は緩くていい
- インポータを書く
  - 実際は Base の継承だけでいいので中身は書く必要はない
  - ファイル名とクラス名を規約に沿わす
- Rake タスクにインポータを追記する
  - `lib/tasks/db/reconstruction.rake`
- 一括実行スクリプトでインポートする
- できればテストを書く
