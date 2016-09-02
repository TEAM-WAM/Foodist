class CustomField < ApplicationRecord
  belongs_to :customable_field, polymorphic: true
  has_many :custom_values, as: :customable_value
end
