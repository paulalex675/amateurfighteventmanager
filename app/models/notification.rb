class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true, dependent: :destroy
  belongs_to :recipient, class_name: :User, foreign_key: :recipient_id
  belongs_to :actor, class_name: :User, foreign_key: :actor_id

  def unread?
    self.read_at == nil ? true : false
  end

end
