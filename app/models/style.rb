class Style < ApplicationRecord
  has_many :fight_records, class_name: "FightRecord", foreign_key: "style_id"
  has_many :gyms, class_name: :Gym, foreign_key: "style_id"
  has_many :fight_profiles, class_name: "FightProfile", foreign_key: "style_id"
  
end
