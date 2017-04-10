class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: { message: "You have to be logged in to comment" }
  validates :post_id, presence: { message: "Error, need post id" }
end
