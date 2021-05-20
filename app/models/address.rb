class Address < ApplicationRecord
  belongs_to :gym, class_name: "Gym", foreign_key: "gym_id"
end
