class UsersController < ApplicationController
  def cinemas_name
    cinemas = Cinema.joins(movies: [sessions: [viewers: :user]]).
                      where(users: {id: params[:id]}).map{ |cinema| cinema.name }
    render json: cinemas
  end
end