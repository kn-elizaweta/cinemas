class SessionsController < ApplicationController
  def movie_session
    session = Session.find(params[:id])
    render json: {movie_name: session.movie.name, 
                  viewers_count: session.viewers.count,
                  session_time: session.time}
  end

  def money
    sessions = Session.all  
    sessions = Filter::Sessions.filter(params, sessions)
    render json: sessions.map{ |session| (session.price*session.viewers.count).to_i }.sum
  end

  def update
    session = Session.find(params[:id])
      if session.update(session_params)
        render json: session
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private

  def session_params
    params.require(:session).permit(:movie_id, :viewers_count, :time, :price, :date, 
                                    viewers_attributes: [:id, :user_id, :booking,
                                     :bought, :_destroy])
  end
end

# put 
# localhost:3000/sessions/1
# body запроса
# {
#     "price": 350,
#     "viewers_attributes": [
#         {"id": 1,
#         "bought": true},
#         {"id": 2,
#         "bought": true},
#         {"id": 3,
#         "_destroy": true}
#     ]
# }