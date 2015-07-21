class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :score, default: 0
      t.timestamps null: false
    end
  end
end
