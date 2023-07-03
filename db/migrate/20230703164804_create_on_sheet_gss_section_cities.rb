class CreateOnSheetGssSectionCities < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_gss_section_cities do |t|
      t.string :product_name, null: true, comment: 'タイトル名'
      t.string :country_name, null: true, comment: '国名'
      t.string :city_name, null: true, comment: '都市名'

      t.boolean :is_available, null: true, comment: '利用可能かどうか'
      t.boolean :is_town_or_village_or_city, null: true, comment: '町か村か都市か'
      t.boolean :is_dungeon, null: true, comment: 'ダンジョンかどうか'
      t.boolean :is_architecture, null: true, comment: '建造物かどうか'
      t.boolean :is_others, null: true, comment: 'その他かどうか'

      t.string :memo, null: true, comment: '備考'

      t.timestamps
    end
  end
end
