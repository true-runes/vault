class CreateGssCharacterToProductTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :gss_character_to_product_titles do |t|
      t.references :gss_character, null: false, foreign_key: true, comment: '総選挙キャラ'
      t.references :product_title, null: false, foreign_key: true, comment: '作品'

      t.timestamps
    end
  end
end
