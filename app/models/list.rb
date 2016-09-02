class List < ApplicationRecord

  belongs_to :listable, polymorphic: true
  has_many :list_restaurants
  has_many :custom_fields, as: :customable_field
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  has_many :restaurants, through: :list_restaurants
end
