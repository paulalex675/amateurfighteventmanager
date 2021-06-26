class Event < ApplicationRecord
  belongs_to :host, class_name: "Gym", foreign_key: "gym_id"
  has_many :fights, class_name: "Fight", foreign_key: "event_id"
  has_many :users, class_name: "User", :through => :fights
  has_many :addresses, as: :hostable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :sign_ups
  has_many :users, through: :sign_ups
 
  
end
