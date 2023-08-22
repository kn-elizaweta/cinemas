class Viewer < ApplicationRecord
    belongs_to :session 
    belongs_to :user
    validate :check_viewer, on: :create
   after_update :check_ticket
   def check_ticket
        if self.bought == false && self.booking == false
        self.destroy
        end
    end
   def check_viewer
        if self.bought == false && self.booking == false
         errors.add(:check, "Нельзя создать с такими параметрами")
        end
      end
end