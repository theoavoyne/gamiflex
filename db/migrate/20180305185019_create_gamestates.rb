class CreateGamestates < ActiveRecord::Migration[5.1]
  def change
    create_table :gamestates do |t|
      t.references :user, foreign_key: true
      t.integer :game_id
      t.string :state

      t.timestamps
    end
  end
end
