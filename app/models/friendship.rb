class Friendship < ApplicationRecord
  validates :user_a_id, uniqueness: { scope: :user_b_id }
  validate :no_self_referential_friendships
  validate :no_duplicated_friendships

  belongs_to :user_a, class_name: :User
  belongs_to :user_b, class_name: :User
  

  private
  
  def no_self_referential_friendships
    if user_a_id == user_b_id
      errors[:base] << 'No self referential friendships allowed'
    end
  end

  def no_duplicated_friendships
    if Friendship.exists?(user_a_id: user_b_id, user_b_id: user_a_id)
      errors[:base] << 'This friendship already exists with the opposite references'
    end
  end
end
