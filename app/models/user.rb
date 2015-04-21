class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password
  has_many :songs
end