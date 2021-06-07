class FightRecord < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"

  def total_fights
    self.win + self.draw + self.lose
  end

  def win_percentage
    (self.win/self.total_fights.to_f) * 100
  end
end
