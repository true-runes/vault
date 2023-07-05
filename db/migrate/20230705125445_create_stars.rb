class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars do |t|
      t.string :seating_order, null: true, comment: '108星の順番'
      t.string :name, null: true, comment: '108星の名前'
      t.string :name_en, null: true, comment: '108星の英語名'

      t.timestamps
    end
  end
end
