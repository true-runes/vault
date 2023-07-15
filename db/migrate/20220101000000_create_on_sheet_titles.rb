class CreateOnSheetTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_titles do |t|
      t.string :name, null: true, comment: '作品名'
      t.string :name_en, null: true, comment: '作品名（英語）'

      t.timestamps
    end

    add_index :on_sheet_titles, :name, unique: true
    add_index :on_sheet_titles, :name_en, unique: true
  end
end
