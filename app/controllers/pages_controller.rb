class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :games ]

  def home
    if policy(Game).suggest?
      if current_user.suggestion.length == 0
        @empty = true
      else
        @suggestion = current_user.suggestion
        @empty = false
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
