# Vault
- Suikoden series' "Vault, Storage or Warehouse."

# インポートの手順

#### 1. YAML を編集
- `config/spreadsheet/worksheets_on_id.yml`

#### 2. CSV に書き出すタスクを実行する

```bash
$ bundle exec rails db:download_csv:execute
```

#### 3. CSV をデータソースとするインポートタスクを実行する

```bash
$ bundle exec rails db:reconstruction:execute
```
