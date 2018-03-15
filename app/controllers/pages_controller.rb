class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @top_rated = State
      .where(state: "like")
      .group(:game_id)
      .count
      .sort_by { |key, value| -value }[1..10]
      .map { |game, count| Game.find_with_igdb(game) }

    @currently_consulted = Game.last(10)
  end

  def profile
    @nb_likes = current_user.states.where(state: "like").count
    @nb_dislikes = current_user.states.where(state: "dislike").count
    @last_games = current_user.games.last(3)
    @date_creation = current_user.created_at.strftime("%B %d, %Y")
  end

  def mygames
  end

  def suggestions
    @suggestion = current_user.all_games_probability[0..5].map { |game_id, index| Game.find_with_igdb(game_id)}
    @suggestion = nil if @suggestion == []
    @probability = (current_user.probability(@suggestion[0]) / 2) + 0.5
    @probability = @probability > 0.7 ? @probability : 0.71
    sleep 3
  end

  def choose
    if policy(current_user).choose_games?
      games_played = current_user.states.pluck(:game_id).map { |game_id| game_id.to_s }
      game_list = %w(233 987 559 1628 6036 8173 533 1942 1020 20 239 127 501 72 7331 974 27081 1905 7360 121 2691 529 12517 11198 4754 36872 1331 2350  9061 434)
      game_list = game_list - games_played
      @games = game_list.map do |game|
        Game.find_with_igdb(game)
      end
      @remaining = 5 - current_user.states.where(state: 'like').length
    else
      redirect_to suggestions_path
    end
  end
end
