class Session < ApplicationRecord
    has_many :viewers, dependent: :destroy
    belongs_to :movie
    accepts_nested_attributes_for :viewers
end