class CreateOnSheetCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_characters do |t|
      t.string :star_attr, null: true, comment: '108星の名前'

      t.string :s1, null: true, comment: '幻水Iでの名前'
      t.string :s1_str, null: true, comment: '幻水Iでの名前の単純な文字列'
      t.string :s1_yomi, null: true, comment: '幻水Iでの名前の読み仮名'
      t.string :s1_en, null: true, comment: '幻水Iでの名前（英語）'

      t.string :s2, null: true, comment: '幻水IIでの名前'
      t.string :s2_str, null: true, comment: '幻水IIでの名前の単純な文字列'
      t.string :s2_yomi, null: true, comment: '幻水IIでの名前の読み仮名'
      t.string :s2_en, null: true, comment: '幻水IIでの名前（英語）'

      t.string :s3, null: true, comment: '幻水IIIでの名前'
      t.string :s3_str, null: true, comment: '幻水IIIでの名前の単純な文字列'
      t.string :s3_yomi, null: true, comment: '幻水IIIでの名前の読み仮名'
      t.string :s3_en, null: true, comment: '幻水IIIでの名前（英語）'

      t.string :s4, null: true, comment: '幻水IVでの名前'
      t.string :s4_str, null: true, comment: '幻水IVでの名前の単純な文字列'
      t.string :s4_yomi, null: true, comment: '幻水IVでの名前の読み仮名'
      t.string :s4_en, null: true, comment: '幻水IVでの名前（英語）'

      t.string :s5, null: true, comment: '幻水Vでの名前'
      t.string :s5_str, null: true, comment: '幻水Vでの名前の単純な文字列'
      t.string :s5_yomi, null: true, comment: '幻水Vでの名前の読み仮名'
      t.string :s5_en, null: true, comment: '幻水Vでの名前（英語）'

      t.string :tk, null: true, comment: 'TKでの名前'
      t.string :tk_str, null: true, comment: 'TKでの名前の単純な文字列'
      t.string :tk_yomi, null: true, comment: 'TKでの名前の読み仮名'
      t.string :tk_en, null: true, comment: 'TKでの名前（英語）'

      # The Woven Web of a Century
      t.string :woven, null: true, comment: '紡時での名前'
      t.string :woven_str, null: true, comment: '紡時での名前の単純な文字列'
      t.string :woven_yomi, null: true, comment: '紡時での名前の読み仮名'
      t.string :woven_en, null: true, comment: '紡時での名前（英語）'

      t.string :water_margin, null: true, comment: '水滸伝での名前'
      t.string :water_margin_yomi, null: true, comment: '水滸伝での名前の読み仮名'
      t.string :water_margin_en, null: true, comment: '水滸伝での名前（英語）'

      t.timestamps
    end
  end
end
