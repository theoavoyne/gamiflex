class AddPhotoDetailsToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :photo_width, :integer
    add_column :games, :photo_height, :integer
  end
end
