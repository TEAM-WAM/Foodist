class CustomValue < ApplicationRecord
  belongs_to :custom_field
  belongs_to :customable_value, polymorphic: true
end
