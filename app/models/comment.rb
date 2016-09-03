class Comment < ApplicationRecord

  belongs_to :user
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true

  validates :body, :commentable_type, :user_id, :commentable_id, presence: true
  validates :body, length: { maximum: 1000 }

end
