class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.string :name, null: false, comment: '作品タイトル名'
      t.string :name_en, null: false, comment: '作品タイトル名（英語）'

      t.timestamps
    end

    add_index :titles, :name, unique: true
    add_index :titles, :name_en, unique: true
  end
end
