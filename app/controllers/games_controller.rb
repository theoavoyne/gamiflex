class GamesController < ApplicationController
  skip_before_action :authenticate_user!

  def show

    # Public information
    @id = params[:id]
    @game = Game.find_with_igdb(@id)
    likes = State.where(game: @game, state: "like").count
    dislikes = State.where(game: @game, state: "dislike").count
    @reviews = likes + dislikes
    @recommend = @reviews.zero? ? 0 : likes / (@reviews).to_f

    # User needs to be signed in
    if user_signed_in?
      # Does the user already rated this game?
      if State.where(user: current_user, game: @game).exists?
        @show_btn = false
        @state = State.where(user: current_user, game: @game).take.state
        @probability = @state == "like" ? 1 : 0
      else
        @probability = (current_user.probability(@game) / 2) + 0.5
        @probability += (1 - @probability) / 2
        @show_btn = true
      end
    end
    authorize @game
  end

  def search
    authorize(Game)
    query =params[:query]

    url = "https://api-endpoint.igdb.com/games/?search=#{query}&fields=name,cover.url,release_dates.human,summary"
    headers = {
      "user-key" => ENV["user_key"],
      "Accept" => "application/json"
    }
    response = HTTParty.get(url, headers: headers)

    render json: response.body
  end
end
