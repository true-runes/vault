class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.references :star, null: false, foreign_key: true, comment: '宿星'

      t.string :name, null: false, default: '', comment: 'キャラ名（「極」に準ずる）'
      t.string :yomi, null: false, default: '', comment: 'キャラ名の読み仮名'
      t.string :name_en, null: false, default: '', comment: 'キャラ名（英語）'

      t.timestamps
    end
  end
end
