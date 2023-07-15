class CreateGssCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :gss_characters do |t|
      t.string :name, null: false, default: '', comment: 'キャラ名（極ベース）'
      t.string :sosenkyo_name, null: false, default: '', comment: '総選挙順位発表用キャラ名'

      t.timestamps
    end
  end
end
