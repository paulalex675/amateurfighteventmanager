class Fight < ApplicationRecord
  validates :fighter_b_id, uniqueness: { scope: :fighter_a_id }
  validate :no_self_fights
  belongs_to :fighter_a, class_name: "FightProfile", foreign_key: "fighter_a_id"
  belongs_to :fighter_b, class_name: "FightProfile", foreign_key: "fighter_b_id"
  belongs_to :event, class_name: "Event", foreign_key: "event_id"
  has_one :style, foreign_key: "style_id"
  has_one :winner, class_name: "User", foreign_key: "winner_id"

  def no_self_fights
    if fighter_a_id == fighter_b_id
      errors[:fighter_b_id] << 'Fighters cannot fight themselves'
    end
  end

  def fighters
    [self.fighter_a, self.fighter_b]
  end
end
