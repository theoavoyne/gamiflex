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
end
