class ListExperience < ApplicationRecord
  belongs_to :list_restaurant
  has_many :custom_values, as: :customable_value
end
