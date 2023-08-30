class Cinema < ApplicationRecord
  has_many :cinemas_movies, dependent: :destroy
  has_many :movies, through: :cinemas_movies
  has_many :sessions
  has_many :users_cinemas
  has_many :users, through: :users_cinemas
  accepts_nested_attributes_for :movies
end