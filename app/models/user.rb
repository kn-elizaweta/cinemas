class User < ApplicationRecord
    has_many :viewers
    has_many :users_cinemas
    has_many :cinemas, through: :users_cinemas
    validates :password, presence: true
end