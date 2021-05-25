class Event < ApplicationRecord
  belongs_to :host, class_name: "Gym", foreign_key: "gym_id"
  has_many :fights, class_name: "Fight", foreign_key: "event_id"
  has_many :fighters, class_name: "User", :through => :fights
end
