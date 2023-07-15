class CreateProductTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :product_titles do |t|
      t.string :name, null: true, comment: '作品名'
      t.string :name_en, null: true, comment: '作品名（英語）'

      t.timestamps
    end
  end
end
