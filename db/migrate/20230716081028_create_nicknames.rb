class CreateNicknames < ActiveRecord::Migration[7.0]
  def change
    create_table :nicknames do |t|

      t.timestamps
    end
  end
end
