class StatesController < ApplicationController
  def create
    @state = current_user.states.build(state_params)
    @game_id = params[:game_id]

    authorize @state

    if params[:page] == "show"
      @state.save
      redirect_to game_path(@game_id)
    elsif @state.save
      if params[:state] == "like"
      end
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "/"}
        format.js
      end
    end
    @remaining = 5 - current_user.states.length
  end

  def destroy
    @state = State.find(params[:id])
    authorize @state
    @state.destroy

    redirect_to mygames_path
  end

  private

  def state_params
    params.permit(:game_id, :state)
  end
end
