class GamesController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @id = params[:id]
    @game = Game.find_with_igdb(@id)
    authorize @game
  end
end
