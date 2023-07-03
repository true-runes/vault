class CreateOnSheetGssSectionHqCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_gss_section_hq_characters do |t|
      t.boolean :is_available, null: false, default: false, comment: '利用可能かどうか'
      t.string :product_name, null: false, comment: 'タイトル名'
      t.string :character_name, null: false, comment: 'キャラクター名'
      t.string :facility_or_position_name,
               null: false, default: '', comment: '施設名・役職名'
      t.string :role_of_hq_on_system,
               null: false, default: '', comment: '本拠地での役割（システム面）'
      t.string :note, null: false, default: '', comment: '備考'

      t.timestamps
    end

    # タイトル名とキャラ名の複合主キー
    add_index :on_sheet_gss_section_hq_characters,
              %i[product_name character_name],
              unique: true,
              name: 'index_gss_section_hq_characters_on_product_and_character'
  end
end
