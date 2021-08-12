class FightRecord < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :style, class_name: "Style"

  def total_fights
    self.win.to_i + self.draw.to_i + self.lose.to_i
  end

  def win_percentage
    ((self.win/self.total_fights.to_f) * 100).round(1)
  end

  def set_score
    self.update(fight_score: (self.win.to_i * 3) + self.draw.to_i + (self.win_percentage))
  end 

  def add_win
    self.update(win: + 1)
    self.set_score
  end

  def add_draw
    self.update(draw: + 1)
    self.set_score
  end

  def add_loss
    self.update(lose: + 1)
    self.set_score
  end

end
