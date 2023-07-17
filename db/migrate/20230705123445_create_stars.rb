class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars do |t|
      t.string :seating_order, null: false, comment: '108星の順番'
      t.string :name, null: false, comment: '108星の名前'
      t.string :yomi, null: false, default: '', comment: '108星の読み仮名'
      t.string :name_en, null: false, comment: '108星の英語名'

      t.timestamps
    end

    add_index :stars, :seating_order, unique: true
    add_index :stars, :name, unique: true
    add_index :stars, :name_en, unique: true
  end
end
