require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "PUT /update" do
    it "update" do
      movie = FactoryBot.create(:movie)
      put "/movies/#{movie.id}", params: {'movie' => {'name' => 'Frozen'} } 
      expect(Movie.find(movie.id).name).to eq("Frozen")
    end
    it "update with rating" do
      movie = FactoryBot.create(:movie)
      user = FactoryBot.create(:user)
      put "/movies/#{movie.id}", params: {'movie' => {'grades_attributes' => 
                                          [{'user_id' => user.id, 'rating' => 9}]} }
      expect(Movie.find(movie.id).grades.last.rating).to eq(9)
    end
    it "update with review" do
      movie = FactoryBot.create(:movie)
      user = FactoryBot.create(:user)
      grade = FactoryBot.create(:grade)
      put "/movies/#{movie.id}", params: {'movie' => {'reviews_attributes' => 
                                          [{'user_id' => user.id, 'grade_id' => grade.id,
                                          'review_text' => 'My favourite movie!'}]} }
      expect(Movie.find(movie.id).reviews.last.review_text).to eq('My favourite movie!')
    end
  end
end