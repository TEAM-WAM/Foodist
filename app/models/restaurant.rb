class Restaurant < ApplicationRecord
  has_many :list_restaurants
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
