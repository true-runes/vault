class CreateGssCharacterToNicknames < ActiveRecord::Migration[7.0]
  def change
    create_table :gss_character_to_nicknames do |t|

      t.timestamps
    end
  end
end
