class CreateCharacterToStars < ActiveRecord::Migration[7.0]
  def change
    create_table :character_to_stars do |t|
      t.references :character, null: false, foreign_key: true, comment: 'キャラクター'
      t.references :star, null: false, foreign_key: true, comment: '108星'

      t.timestamps
    end
  end
end
