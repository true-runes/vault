class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false, default: '', comment: 'キャラ名（「極」に準ずる）'
      t.string :name_en, null: false, default: '', comment: 'キャラ名（英語）'

      t.timestamps
    end
  end
end
