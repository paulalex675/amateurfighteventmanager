class Event < ApplicationRecord
  belongs_to :host, class_name: "Gym", foreign_key: "gym_id"
  has_many :fights, class_name: "Fight", foreign_key: "event_id"
  has_many :users, class_name: "User", :through => :fights
  has_many :addresses, as: :hostable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :sign_ups
  has_many :users, through: :sign_ups
  has_many :bookings, dependent: :destroy
  has_many :tickets, :through => :bookings
  
  def upcoming?
    self.event_date > Time.now
  end

  def tickets_remaining
    self.num_tickets - self.tickets.count
  end
  
end
