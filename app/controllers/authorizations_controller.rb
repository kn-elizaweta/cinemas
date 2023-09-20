class AuthorizationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      render json: { success: true }
    else
      raise 'Email or Password is Invalid'
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: 'You have successfully logged out'} 
  end
end