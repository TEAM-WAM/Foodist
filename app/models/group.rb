class Group < ApplicationRecord

  has_many :lists, as: :listable
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :members, class_name: "User"

  validates :name, :description, :creator_id, presence: true
  validates_associated :users
  validates :name, length { maximum: 50 }
  validates :description, length { maximum: 300 }

end
