class Gym < ApplicationRecord
  belongs_to :owner, class_name: :User, foreign_key: :user_id
  has_many :addresses, class_name: "Address", foreign_key: "gym_id"
  has_one_attached :avatar
end
