class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :states, dependent: :destroy
  has_many :games, through: :states
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def probability(game)
    indexes = all_community_index
    numerator = 0
    denominator = 0
    State.where(game: game).each do |state|
      coef = state.state == "like" ? 1 : -1
      unless state.user_id == self.id
        numerator += coef * indexes[state.user_id]
        denominator += 1
      end
    end
    if denominator == 0
      return 0
    else
      return numerator / denominator.to_f
    end
  end

  def all_games_probability
    games = {}

    Game
      .joins("inner join states on states.game_id = games.id")
      .where
      .not(id: self.games)
      .distinct
      .each do |game|
        games[game.id] = probability(game)
      end

    return games.sort_by { |key, value| -value }
  end

  private

    def compared_user(user)
    user_1 = self
    user_2 = user

    all_games = State.where(user: [user_1, user_2])
      .group(:game_id, :state)
      .count

    conflicts = State
      .where(user: [user_1, user_2])
      .group(:game_id)
      .having("count(distinct states.state) = 2")
      .count
      .length
  {
    all_games: all_games,
    likes_in_common: all_games.count { |key, value| value == 2 && key[1] == "like"},
    total_likes: all_games.count { |key, value| key[1] == "like"},
    dislikes_in_common: all_games.count { |key, value| value == 2 && key[1] == "dislike"},
    total_dislikes: all_games.count { |key, value| key[1] == "dislike"},
    conflicts: conflicts
  }
  end

  def community_index(user)
    data = compared_user(user)

    numerator = data[:likes_in_common] + data[:dislikes_in_common] - data[:conflicts]
    denominator = data[:total_likes] + data[:total_dislikes] - (2 * data[:conflicts]).to_f

    return numerator / denominator
  end

  def all_community_index
    @all_community_index ||= fetch_all_community_index
  end

  def fetch_all_community_index
    indexes = {}

    User.all.each do |user|
      indexes[user.id] = community_index(user) unless user == self
    end

    return indexes
  end

end
