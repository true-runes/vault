class CreateOnSheetGssCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_gss_characters do |t|
      t.string :gensosenkyo_name, null: true, comment: '総選挙での名前'
      t.string :name, null: false, comment: '名前'

      t.boolean :has_nickname, null: true, comment: '別名を持つかどうか'
      t.boolean :exists_gs1, null: false, comment: '幻水Iに登場するかどうか'
      t.boolean :exists_gs2, null: false, comment: '幻水IIに登場するかどうか'
      t.boolean :exists_gs3, null: false, comment: '幻水IIIに登場するかどうか'
      t.boolean :exists_gs4, null: false, comment: '幻水IVに登場するかどうか'
      t.boolean :exists_gs5, null: false, comment: '幻水Vに登場するかどうか'
      t.boolean :exists_in_each_gaiden, null: false, comment: '各外伝に登場するかどうか'
      t.boolean :exists_gaiden1, null: false, comment: '幻水外伝1に登場するかどうか'
      t.boolean :exists_gaiden2, null: false, comment: '幻水外伝2に登場するかどうか'
      t.boolean :exists_rhapsodia, null: false, comment: 'ラプソディアに登場するかどうか'
      t.boolean :exists_tk, null: false, comment: 'TKに登場するかどうか'
      t.boolean :exists_tsumutoki, null: false, comment: '紡時に登場するかどうか'

      t.string :memo, null: true, comment: '備考'

      t.timestamps
    end
  end
end
