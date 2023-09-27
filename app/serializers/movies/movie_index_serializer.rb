module Movies
  class MovieIndexSerializer < ActiveModel::Serializer
    attributes :name, :genre, :duration
    has_many :grades
  end
end