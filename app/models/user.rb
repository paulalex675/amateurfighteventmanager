class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github]

  
  has_many :notifications, foreign_key: :recipient_id
  has_many :posts, dependent: :destroy
  has_many :comments, foreign_key: :user_id, dependent: :destroy
  has_many :likes, foreign_key: :liker_id, dependent: :destroy
  has_many :liked_posts, class_name: 'Post', through: :likes
  has_one_attached :avatar, dependent: :destroy
  validates :avatar, content_type: [:png, :jpg, :jpeg]
  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest, dependent: :destroy
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest
  has_many :friendships, ->(user) { where("user_a_id = ? OR user_b_id = ?", user.id, user.id) }
  has_many :friends, through: :friendships
  has_many :gyms, foreign_key: :user_id
  has_one :gym, class_name: "Gym", foreign_key: "gym_id"
  has_many :fight_profiles, dependent: :destroy
  has_many :fight_records, dependent: :destroy
  has_many :sign_ups
  has_many :participations, class_name: "Event", through: :sign_ups
  has_many :bookings, dependent: :destroy
  has_many :tickets, through: :bookings
  
  

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.first_name = provider_data.info.first_name
      user.last_name = provider_data.info.last_name
      user.password = Devise.friendly_token[0, 20]
      user.provider_picture = provider_data.info.image
    end
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

  def profile_picture
    if self.avatar.attached? && self.avatar.representable?
      avatar.variant(resize: '100x100').processed
    elsif provider_picture?
      provider_picture
    else
      "/assets/defaultprofile.png"
    end
  end

  def full_name
    "#{self.first_name} " + "#{self.last_name}"
  end

  def is_admin?
    self.admin?
  end

  after_create :welcome_send
  def welcome_send
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
