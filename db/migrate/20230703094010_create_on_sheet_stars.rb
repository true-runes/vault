class CreateOnSheetStars < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_stars do |t|
      t.string :seating_order, null: true, comment: '108星の順番'
      t.integer :category, null: false, comment: '(enum) 天罡星三十六星 or 地煞星七十二星'
      t.string :name, null: true, comment: '108星の名前'
      t.string :yomi, null: true, comment: '108星の名前（読み仮名）'
      t.string :name_en, null: true, comment: '108星の英語名'

      t.timestamps
    end

    add_index :on_sheet_stars, :seating_order, unique: true
  end
end
