class Game < ApplicationRecord
  validates :id, presence: true
  validates :name, presence: true

  class << self
    def find_with_igdb(game_id)

      # Create Game by calling IGDB API if not in the DB
      unless Game.where(id: game_id).exists?
        IGDB.find(game_id)
      end

      # Return Game object
      return Game.where(id: game_id).take
    end
  end
end
