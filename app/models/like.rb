class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates_uniqueness_of :tweet_id, scope: :user_id

end
