class Profile < ApplicationRecord

  belongs_to :user

  validates :user_id, presence: true
  validates :zipcode, length { maximum: 10 }
  validates :phone_number, length { maximum: 16 }
  validates :gender, length { maximum: 50 }
  validates :bio, length { maximum: 300 }
  validates_date :birthday

end
