class Movie < ApplicationRecord
  has_one_attached :avatar
  has_many :cinemas_movies
  has_many :sessions, dependent: :destroy
  has_many :cinemas, through: :cinemas_movies
  has_many :grades
  has_many :reviews
  accepts_nested_attributes_for :grades
  accepts_nested_attributes_for :reviews
end