class ListExperience < ApplicationRecord

  belongs_to :list_restaurant
  has_many :custom_values, as: :customable_value

  validates :list_restaurant_id, :date_of_experience, presence: true
  validates :date_of_experience, on_or_before: lambda { Date.current }
  validates :date_of_experience, length { maximum: 50 }
  validates :main_dish, length { maximum: 100 }
  validates :notes, length { maximum: 800 }
  validates_date :date_of_experience

end
