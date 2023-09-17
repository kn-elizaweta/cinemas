class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    render json: user
  end

  def cinemas_name
    cinemas = Cinema.joins(movies: [sessions: [viewers: :user]]).
                      where(users: {id: params[:id]}).map{ |cinema| cinema.name }
    render json: cinemas
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email)
  end
end
