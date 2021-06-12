class FightProfile < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  belongs_to :style
end
