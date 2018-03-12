class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :states
  has_many :games, through: :states
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def suggestion
    time = Time.now
    count = 1 # To display the game number while looping over the user's played games
    game_list = {} # Initializing final output

    self.states.where(state: "like").each do |state|
      puts "//////////////////////Game no. #{count}//////////////////////"

      # -------------------------------
      user_played = find_user_played(state)
      puts "//////////User_played//////////"
      puts "List: #{user_played}"
      puts "List-size: #{user_played.length} users played that game"
      # Return a array of user's ids
      # All these users played the "state.game_id" game!


      # -------------------------------
      populars =  find_populars(user_played)
      puts "//////////Populars//////////"
      puts "List: #{populars}"
      puts "List-size: a total of #{populars.length} game are played in this given list"
      # Return an array of [Game, count] sorted by count
      # It represents all the games played by user_played, sorted by popularity!

      # -------------------------------
      list_size = game_list.length # Take the initial size of the game_list
      max_number_of_insertions = 5

      puts "//////////Inserting time//////////"
      populars.each do |game_id, game_count|

        already_in_list = game_list[game_id]
        already_played = State.where(user_id: self.id, game_id: game_id).exists?

        unless already_in_list || already_played
          global_game_count = State.where(game_id: game_id, state: "like").length
          game_list[game_id] = global_game_count
          puts "-"
          puts "Inserting #{game_id} in the list.."
          puts "#{global_game_count} users liked this game"
          puts "-"
          break if game_list.length - list_size == max_number_of_insertions
        end
      end
      puts "Insertions are done for this game"
      puts "#{game_list.length - list_size} games have been inserted in the list"
      # Insert games inside the game_list
      # The games inserted are the most populars of the "populars" list
      # It can't insert more than "max_number_of_insertions" games from the same "populars" list

      count += 1
    end

    intermediary_list = game_list.sort_by { |key, value| -value }
    final_list = intermediary_list.map do |key, value|
      Game.find_with_igdb(key)
    end

    puts "Fast: #{Time.now - time}s"
    return final_list
  end

  # prep new algorithm

  def likes_in_common(user)
    user_1 = self
    user_2 = user

    State.where(user: [user_1, user_2], state: "like").group(:game_id).count.count { |key, value| value == 2 }
  end

  def dislikes_in_common(user)
    user_1 = self
    user_2 = user

    State.where(user: [user_1, user_2], state: "dislike").group(:game_id).count.count { |key, value| value == 2 }
  end

  def total_likes(user)
    user_1 = self
    user_2 = user

    State.where(user: [user_1, user_2], state: "like").group(:game_id).count.length
  end

  def total_dislikes(user)
    user_1 = self
    user_2 = user

    State.where(user: [user_1, user_2], state: "dislike").group(:game_id).count.length
  end
  # __________________

  private

  def find_user_played(state)
    State.where(game_id: state.game_id, state: "like").map { |state| state.user_id }
  end

  def find_populars(users)
    State.where(user_id: users).group(:game_id).count.sort_by { |key, value| -value }
  end
end
