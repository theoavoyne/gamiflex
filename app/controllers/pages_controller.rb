class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :games ]

  def home
  end

  def profile
    @name = current_user.first_name
  end

  def games
    @game_id = params[:id]
  end
end
