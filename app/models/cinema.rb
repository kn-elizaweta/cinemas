class Cinema < ApplicationRecord
  has_many :cinemas_movies, dependent: :destroy
  has_many :movies, through: :cinemas_movies
  has_many :sessions, through: :movies
  accepts_nested_attributes_for :movies
end