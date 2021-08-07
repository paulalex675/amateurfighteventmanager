class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :tickets, allow_destroy: true
end
