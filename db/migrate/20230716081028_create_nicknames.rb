class CreateNicknames < ActiveRecord::Migration[7.0]
  def change
    create_table :nicknames do |t|
      # ja と en で分けるまではしない
      t.string :name

      t.timestamps
    end
  end
end
