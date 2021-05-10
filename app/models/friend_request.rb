class FriendRequest < ApplicationRecord
  validates :receiver_id, uniqueness: { scope: :requestor_id }
  validate :no_self_referential_friend_requests
  validate :request_in_one_direction_only
  validate :no_requests_to_current_friends, if: -> { requestor }


  belongs_to :requestor, class_name: :User, foreign_key: :requestor_id
  belongs_to :receiver, class_name: :User, foreign_key: :receiver_id

  private

  def no_self_referential_friend_requests
    if requestor_id == receiver_id
      errors[:receiver_id] << 'No self referential friend requests allowed.'
    end
  end

  def request_in_one_direction_only
    if FriendRequest.exists?(requestor_id: receiver_id, receiver_id: requestor_id)
      errors[:receiver_id] << 'There is a pending request from this user.'
    end
  end

  def no_requests_to_current_friends
    if requestor.friends.any? { |friend| friend.id == receiver.id }
      errors[:receiver_id] << 'User is already friends with this recipient.'
    end
  end
end
