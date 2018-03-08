class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

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
  end

  def mygames
  end
end
