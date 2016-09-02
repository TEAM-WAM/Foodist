class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #to call activerecord association for has_one profile, use build_profile
  has_one :profile, dependent: :destroy
  has_many :comments
  has_many :lists, as: :listable
  has_many :created_groups, class_name: "Group", foreign_key: :creator_id
  has_and_belongs_to_many :groups

  validates :username, :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create, message: "Must be valid email format(example: example@gmail.com)" }
  validates :username, :email, uniqueness: true
  validates :username, :first_name, :last_name, length: { maximum: 100 }
end
