class Movie < ApplicationRecord
  has_many :cinemas_movies
  has_many :sessions, dependent: :destroy
  has_many :cinemas, through: :cinemas_movies
end