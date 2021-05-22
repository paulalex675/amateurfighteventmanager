class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github]

  
  has_many :notifications, foreign_key: :recipient_id
  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :liked_posts, class_name: 'Post', through: :likes
  has_one_attached :avatar
  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest, dependent: :destroy
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest
  has_many :friendships, ->(user) { where("user_a_id = ? OR user_b_id = ?", user.id, user.id) }
  has_many :friends, through: :friendships
  has_many :gyms, foreign_key: :user_id
  has_one :gym, class_name: "Gym", foreign_key: "gym_id"
  

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.first_name = provider_data.info.first_name
      user.last_name = provider_data.info.last_name
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def name
    self.name = "#{User.first_name} #{User.last_name}"
  end

  def friends
    join_statement = <<-SQL
      INNER JOIN friendships
        ON (friendships.user_a_id = users.id OR friendships.user_b_id = users.id)
        AND (friendships.user_a_id = #{id} OR friendships.user_b_id = #{id})
    SQL
    User.joins(join_statement)
        .where.not(id: id)
  end

  def gravatar_avatar(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/#{gravatar_id}.png"
  end

  def profile_picture
    if self.avatar.attached?
      avatar
    elsif provider == :facebook
      "http://graph.facebook.com/#{self.uid}/picture?type=normal"
    else
      gravatar_avatar(self)
    end
  end

end
