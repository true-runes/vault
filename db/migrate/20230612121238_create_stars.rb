class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars do |t|

      t.timestamps
    end
  end
end
