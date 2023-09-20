class ViewersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorized?
  def create
   viewer = Viewer.create!(viewer_params)
   render json: viewer
  end 

  def update_status
    viewers = Viewer.where(id: params[:ids])
    a = ["bought", "booking"]
   (params.keys & a).each { |par| viewers.update_all(par => params[par])} 
    # [:bought, :booking]
    # if params[:bought].present?
    #   viewers.update(bought: params[:bought])
    # end
    # if params[:booking].present?
    #   viewers.update(booking: params[:booking])
    # end
   render json: viewers
  end

  private
  def viewer_params
    params[:viewer][:user_id] = current_user.id
    params.require(:viewer).permit(:user_id, :session_id, :booking, :bought)
  end
end

