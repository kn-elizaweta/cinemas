require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /cinemas_name" do
    it "cinemas_name" do
      cinema = FactoryBot.create(:cinema)
      session = FactoryBot.create(:session, movie_id: cinema.movies.last.id)
      user = FactoryBot.create(:user)
      viewer = FactoryBot.create(:viewer, session_id: session.id, user_id: user.id)
      get "/users/#{user.id}/cinemas_name"
      expect(JSON.parse(body).last).to eq(cinema.name)
    end
  end
end