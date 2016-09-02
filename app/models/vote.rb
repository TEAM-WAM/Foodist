class Vote < ApplicationRecord
  belongs_to :comment
  belongs_to :list
  belongs_to :restaurant
  belongs_to :voteable, polymorphic: true
end
