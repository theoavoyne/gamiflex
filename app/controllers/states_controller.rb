class StatesController < ApplicationController
  def create
    @state = current_user.states.build(state_params)
    @state.user = current_user
    authorize @state
    @state.save

    redirect_to root_path
  end

  def destroy
  end

  private

  def state_params
    params.permit(:game_id, :state)
  end
end
