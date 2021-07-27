class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :tickets, inverse_of: :booking, dependent: :destroy
  accepts_nested_attributes_for :tickets, allow_destroy: true
end
