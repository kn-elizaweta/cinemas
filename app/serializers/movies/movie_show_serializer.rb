module Movies
  class MovieShowSerializer < ActiveModel::Serializer
    attributes :name, :genre, :duration
    has_many :grades
    has_many :reviews
  end
end