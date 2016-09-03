class ListRestaurant < ApplicationRecord

  belongs_to :list
  belongs_to :restaurant
  has_many :list_experiences
  has_many :custom_fields, as: :customable_field
  has_many :custom_values, as: :customable_value

  validates :name, :restaurant_id, :list_id, presence: true
  validates_associated :list_experiences
  validates :name, :cuisine, :fav_dish, :restaurant_type, length { maximum: 100 }

end
