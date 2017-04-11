class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :user_id, presence: { message: "You have to be logged in to post" }
  validates :title, length: {minimum: 2}
  validates :body, length: {minimum: 2}
end
