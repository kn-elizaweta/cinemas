module Cinemas
  class CinemaShowSerializer < ActiveModel::Serializer
    attributes :name, :cinema_hall_count, :location
    has_many :movies
    has_many :sessions
    has_many :users
  end
end
