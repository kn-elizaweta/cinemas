require 'rails_helper'

RSpec.describe "Cinemas", type: :request do
  describe "GET /index" do
    it "index" do
      cinema = FactoryBot.create(:cinema)
      get '/cinemas'

      expect(JSON.parse(body).first['name']).to eq(cinema.name)
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
