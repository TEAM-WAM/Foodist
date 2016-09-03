class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true

  validates :voteable_type, :voteable_id, presence: true
end
