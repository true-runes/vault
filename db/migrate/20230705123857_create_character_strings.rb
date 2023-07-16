class CreateCharacterStrings < ActiveRecord::Migration[7.0]
  def change
    create_table :character_strings do |t|
      # 「ルック」は一つとして扱い、「ゴードン (II)」と「ゴードン (III)」も「ゴードン」として一つに扱う
      t.string :name, null: false, default: '', comment: 'キャラ名（「極」に準じ、記述上同一ならば同一とする）'

      t.timestamps
    end

    add_index :character_strings, :name, unique: true
  end
end
