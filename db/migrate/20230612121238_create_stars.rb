class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars do |t|
      t.string :name, null: false, comment: '宿星の名前（日本語）'
      t.string :name_en, null: false, comment: '宿星の名前（英語）'
      t.integer :seating_order, null: false, comment: '席次'

      t.timestamps
    end

    add_index :stars, :name, unique: true
    add_index :stars, :seating_order, unique: true
  end
end
