class CreateOnSheetNicknames < ActiveRecord::Migration[7.0]
  def change
    create_table :on_sheet_nicknames do |t|
      t.string :name, null: true, comment: '本名（ゴルドーは区別される）'
      t.string :nickname_00, null: true, comment: 'ニックネーム00（総選挙名と同一）'
      t.string :nickname_01, null: true, comment: 'ニックネーム01'
      t.string :nickname_02, null: true, comment: 'ニックネーム02'
      t.string :nickname_03, null: true, comment: 'ニックネーム03'
      t.string :nickname_04, null: true, comment: 'ニックネーム04'
      t.string :nickname_05, null: true, comment: 'ニックネーム05'
      t.string :nickname_06, null: true, comment: 'ニックネーム06'
      t.string :nickname_07, null: true, comment: 'ニックネーム07'
      t.string :nickname_08, null: true, comment: 'ニックネーム08'
      t.string :nickname_09, null: true, comment: 'ニックネーム09'
      t.string :nickname_10, null: true, comment: 'ニックネーム10'
      t.string :nickname_11, null: true, comment: 'ニックネーム11'
      t.string :nickname_12, null: true, comment: 'ニックネーム12'
      t.string :nickname_13, null: true, comment: 'ニックネーム13'
      t.string :nickname_14, null: true, comment: 'ニックネーム14'
      t.string :nickname_15, null: true, comment: 'ニックネーム15'
      t.string :nickname_16, null: true, comment: 'ニックネーム16'

      t.timestamps
    end

    add_index :on_sheet_nicknames, :name, unique: true
    add_index :on_sheet_nicknames, :nickname_00, unique: true
  end
end
