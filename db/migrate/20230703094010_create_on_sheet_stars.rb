class CreateOnSheetStars < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_stars do |t|
      t.string :seating_order, null: false, comment: '108星の順番'
      t.string :name, null: false, comment: '108星の名前'
      t.string :name_en, null: false, comment: '108星の英語名'

      t.timestamps
    end

    add_index :on_sheet_stars, :seating_order, unique: true
  end
end
