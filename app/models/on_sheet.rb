# OnSheet:: ではそれ以上の名前空間に分けない（2階層以上にしたくない）
# 総選挙のテーブルであれ、その他のテーブルであれ、OnSheet:: で統一する
module OnSheet
  def self.table_name_prefix
    'on_sheet_'
  end
end
