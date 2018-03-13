class GamesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @id = params[:id]
    @game = Game.find_with_igdb(@id)
    @show_btn = false
    if user_signed_in? && !State.where(user: current_user, game: @game).exists?
      @show_btn = true
      @state = State.new
    end
    authorize @game
  end

  def search
    authorize(Game)
    query =params[:query]

    url = "https://api-endpoint.igdb.com/games/?search=#{query}&fields=name,cover.url,release_dates.human"
    headers = {
      "user-key" => ENV["user_key"],
      "Accept" => "application/json"
    }
    response = HTTParty.get(url, headers: headers)

    render json: response.body
  end
end
