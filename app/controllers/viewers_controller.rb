class ViewersController < ApplicationController
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
end

