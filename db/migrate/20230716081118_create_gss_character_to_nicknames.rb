class CreateGssCharacterToNicknames < ActiveRecord::Migration[7.0]
  def change
    create_table :gss_character_to_nicknames do |t|
      t.references :gss_character, null: false, foreign_key: true, comment: '総選挙キャラ'
      t.references :nickname, null: false, foreign_key: true, comment: 'ニックネーム'

      t.timestamps
    end
  end
end
