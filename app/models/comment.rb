class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable, dependent: :destroy

end
