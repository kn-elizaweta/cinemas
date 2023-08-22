require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /movie_session" do
    it "movie_session" do
      session = FactoryBot.create(:session)
      get "/sessions/#{session.id}/movie_session"
      expect(JSON.parse(body)["movie_name"]).to eq(session.movie.name)
    end
  end

  describe "GET /money" do
    it "money" do
      session = FactoryBot.create(:session)
      FactoryBot.create(:viewer, session_id: session.id)
      get "/sessions/money"
      a = session.price*session.viewers.count
      expect(JSON.parse(body).to_s).to eq(a)
    end

    it "money with params" do
      session = FactoryBot.create(:session)
      session2 = FactoryBot.create(:session)
      session3 = FactoryBot.create(:session)
      FactoryBot.create(:viewer, session_id: session.id)
      FactoryBot.create(:viewer, session_id: session2.id)
      get "/sessions/money?movie_id=#{session.movie.id}"
      a = session.price*session.viewers.count
      expect(JSON.parse(body).to_s).to eq(a)
    end
  end

end