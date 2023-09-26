class Review < ApplicationRecord
  belongs_to :user
  belongs_to :grade
  belongs_to :movie
end