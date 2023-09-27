class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_one :review
  validates_numericality_of :grade, greater_than: 0, less_than: 11
  validates :single_grade

  def single_grade
   grade = Grade.where(user_id: self.user_id, movie_id: self.movie_id)
   if grade.present?
    errors.add(:grade, "You have already rated this movie")
   end
  end
end