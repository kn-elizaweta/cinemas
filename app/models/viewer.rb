class Viewer < ApplicationRecord
  belongs_to :session 
  belongs_to :user
  validate :check_viewer, on: :create
  after_update :check_ticket
  after_update :bought_ticket
  after_create :bought_ticket
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

    def bought_ticket
      cinema = self.session.cinema
      if previous_changes.key?("bought") && previous_changes["bought"].last && 
        UsersCinema.where(user_id: user.id, cinema_id: cinema.id).blank? 
        UsersCinema.create!(user_id: user.id, cinema_id: cinema.id, discount: 0)
      else
        count = Viewer.where(user_id: user.id).count
        users = UsersCinema.find_by(user_id: user.id, cinema_id: cinema.id)
        if count >= 5 && count < 10
          users.update(discount: 5)
        elsif count >= 10 && count < 15
          users.update(discount: 10)
        elsif count >= 15
          users.update(discount: 15)
        end
      end
    end
  end