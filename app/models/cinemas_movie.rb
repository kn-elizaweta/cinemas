class CinemasMovie < ApplicationRecord
    belongs_to :cinema
    belongs_to :movie, dependent: :destroy
end