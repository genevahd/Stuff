class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :ideas
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, :alias, :email, presence: true
  validates :password, length: { in: 8..14 }, on: :create
  validates :email, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
end
