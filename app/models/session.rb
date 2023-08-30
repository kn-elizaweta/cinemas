class Session < ApplicationRecord
    has_many :viewers, dependent: :destroy
    belongs_to :movie
    belongs_to :cinema
    accepts_nested_attributes_for :viewers
end