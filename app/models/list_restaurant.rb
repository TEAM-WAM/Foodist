class ListRestaurant < ApplicationRecord
  belongs_to :list
  belongs_to :restaurant
  has_many :list_experiences
  has_many :custom_fields, as: :customable_field
  has_many :custom_values, as: :customable_value
end
