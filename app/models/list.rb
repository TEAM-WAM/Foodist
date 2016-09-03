class List < ApplicationRecord

  belongs_to :listable, polymorphic: true
  has_many :list_restaurants
  has_many :custom_fields, as: :customable_field
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :restaurants, through: :list_restaurants

  validates :title, :listable_id, :listable_type, presence: true
  validates_associated :users
  validates :title, length { maximum: 100 }

end
