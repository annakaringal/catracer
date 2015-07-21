class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.timestamps :time_to_complete
      t.boolean :completed, default: false
      t.integer :winner_id
      t.timestamps null: false
    end
  end
end
