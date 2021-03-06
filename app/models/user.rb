# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  session_token   :string           not null
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :goals
  has_many :goal_comments
  has_many :comments_on_a_user,
    class_name: :UserComment,
    foreign_key: :commenting_user_id,
    primary_key: :id

  has_many :comments_from_another_user,
    class_name: :UserComment,
    foreign_key: :commented_user_id,
    primary_key: :id

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.is_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
