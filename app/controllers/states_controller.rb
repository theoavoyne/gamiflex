class StatesController < ApplicationController
  def create
    @state = current_user.states.build(state_params)
    @state.user = current_user
    authorize @state
    @state.save
    # redirect_to params[:redirect] ? root_path : game_path(@state.game)
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
