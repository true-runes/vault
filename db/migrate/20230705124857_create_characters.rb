class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.references :character_string, null: false, comment: 'ユニークキャラ名テーブルへの外部キー'

      # 持たないものもいるので外部キーにはできない
      t.integer :star_id, null: true, comment: '宿星'

      t.string :name, null: false, default: '', comment: 'キャラ名（「極」に準じ、意味が異なる同名キャラは区別する）'
      t.string :yomi, null: false, default: '', comment: 'キャラ名の読み仮名'
      t.string :name_en, null: false, default: '', comment: 'キャラ名（英語）'

      t.timestamps
    end

    add_index :characters, :name, unique: true
    add_index :characters, :name_en, unique: true
  end
end
