class ApplicationController < ActionController::Base
  private
  def current_user
    return if session[:user_id].blank?

    User.find(session[:user_id])
  end

  def authorized?
    if session[:user_id] == nil
      render json: {status: "Not authorized"}, status: 401
    end
  end
end
