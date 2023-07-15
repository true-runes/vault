class CreateOnSheetGssSectionHqCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_gss_section_hq_characters do |t|
      t.boolean :is_available, null: true, comment: '利用可能かどうか'
      t.string :product_name, null: true, comment: 'タイトル名'
      t.string :character_name, null: true, comment: 'キャラクター名'
      t.string :facility_or_position_name, null: true, comment: '施設名・役職名'
      t.string :role_of_hq_on_system, null: true, comment: '本拠地での役割（システム面）'
      t.integer :display_order, null: false, comment: '表示順'
      t.string :note, null: true, comment: '備考'

      t.timestamps
    end
  end
end
