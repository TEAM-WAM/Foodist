class Restaurant < ApplicationRecord

  has_many :list_restaurants
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :name, :address, :city, presence: true
  validates_associated :votes, :comments
  validates :average_cost_for_two, :zipcode, length { maximum: 10 }
  validates :name, :locality, :city, :cuisines, length { maximum: 100 }
  validates :address, length { maximum: 200 }
  validates :restaurant_url, :menu_url, format: { with: URI.regexp }

end
