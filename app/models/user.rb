class User < ApplicationRecord
    has_many :viewers
    has_many :users_cinemas
    has_many :cinemas, through: :users_cinemas
    has_many :grades
    has_many :reviews
    validates :password, presence: true
end