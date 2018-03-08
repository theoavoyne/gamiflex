class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :games ]

  def home
    if user_signed_in?
      if policy(current_user).suggest?
        @suggest = true
        @suggestion = current_user.suggestion
        @state = State.new
      end
    end
  end

  def profile
    @name = current_user.first_name
  end

  def games
    @game_id = params[:id]
    @game = Game.find_with_igdb(@game_id)
  end
end
