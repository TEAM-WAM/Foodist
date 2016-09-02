class Group < ApplicationRecord
  has_many :lists, as: :listable
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :members, class_name: "User"
end
