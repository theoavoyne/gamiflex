class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :game_id
      t.string :name
      t.text :summary
      t.string :release_date
      t.string :suggestions
      t.string :platforms
      t.string :photo
      t.string :genres
      t.string :publishers
      t.string :developers

      t.timestamps
    end
  end
end
