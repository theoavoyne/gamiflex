class RemoveGameIdFromState < ActiveRecord::Migration[5.1]
  def change
    remove_column :states, :game_id
  end
end
