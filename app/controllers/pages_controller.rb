class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :games ]

  def home
    if user_signed_in?
      if policy(current_user).suggest?
        @suggestion = current_user.suggestion
        @suggestion = nil if @suggestion == []
        @state = State.new
      end
    end
  end

  def profile
    @name = current_user.first_name
  end

  def games
    @id = params[:id]
    @game = Game.find_with_igdb(@id)
  end
end
