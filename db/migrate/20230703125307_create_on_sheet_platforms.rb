class CreateOnSheetPlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_platforms do |t|
      t.string :name, null: true, comment: 'ゲーム機の機種名'
      t.string :name_en, null: true, comment: 'ゲーム機の機種名（英語）'
      t.string :nickname, null: true, comment: 'ゲーム機の略称'

      t.timestamps
    end

    add_index :on_sheet_platforms, :name, unique: true
    add_index :on_sheet_platforms, :name_en, unique: true
  end
end
