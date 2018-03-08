class RemoveGameIdFromGame < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :game_id
  end
end
