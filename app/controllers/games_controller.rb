class GamesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @id = params[:id]
    @game = Game.find_with_igdb(@id)
    likes = State.where(game: @game, state: "like").count
    dislikes = State.where(game: @game, state: "dislike").count
    @recommand = dislikes.zero? ? 1 : likes / dislikes.to_f
    @reviews = likes + dislikes
    if user_signed_in? && !State.where(user: current_user, game: @game).exists?
      @probability = (current_user.probability(@game) / 2) + 0.5
      @show_btn = true
      @state = State.new
    else
      @show_btn = false
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
