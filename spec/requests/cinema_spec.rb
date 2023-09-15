require 'rails_helper'

RSpec.describe "Cinemas", type: :request do
  describe "GET /index" do
    it "index" do
      cinema = FactoryBot.create(:cinema)
      get '/cinemas'

      expect(JSON.parse(body).first['name']).to eq(cinema.name)
    end
    it "index with params" do
      cinema = FactoryBot.create(:cinema)
      cinema1 = FactoryBot.create(:cinema)
      movie = FactoryBot.create(:movie)
      cinemas_movies = CinemasMovie.create(cinema_id: cinema.id, movie_id: movie.id)
      get "/cinemas?movie_id=#{movie.id}"
      expect(JSON.parse(body).count).to eq(1)
    end
  end

  describe "POST /create" do
    it 'creates a new Cinema' do
      expect {
        post '/cinemas', params: {'cinema' => {'name' => 'Midnight',
                                 'cinema_hall_count' => '4', 'location' => 'Texas'} } 
      }.to change(Cinema, :count).by(1)
    end 
  end

  describe "DELETE /destroy" do
    it 'destroys a Cinema' do
      cinema = FactoryBot.create(:cinema)
      delete "/cinemas/#{cinema.id}"
      expect(JSON.parse(body).values.join).to eq("OK")
    end
  end
end
