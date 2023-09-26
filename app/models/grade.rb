class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_one :review
  validates_numericality_of :grade, greater_than: 0, less_than: 11
end