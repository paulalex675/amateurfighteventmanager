class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :auther, class_name: 'User', foreign_key: :auther_id
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable, dependent: :destroy
end
