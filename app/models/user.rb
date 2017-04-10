require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :posts
  has_many :comments

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(login_username, login_password)
    self.username == login_username && self.password == login_password
  end
end
