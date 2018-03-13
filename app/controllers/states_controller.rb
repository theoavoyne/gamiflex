class StatesController < ApplicationController
  def create
    @state = current_user.states.build(state_params)
    @game_id = params[:game_id]
    @state.user = current_user

    authorize @state

    if @state.save
      if params[:state] == "like"
        @remaining = 5 - current_user.states.where(state: 'like').length
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
