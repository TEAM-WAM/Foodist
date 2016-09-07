class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_save :create_profiles

  #to call activerecord association for has_one profile, use build_profile
  has_one :profile, dependent: :destroy
  has_many :comments
  has_many :lists, as: :listable
  has_many :created_groups, class_name: "Group", foreign_key: :creator_id
  has_and_belongs_to_many :groups

  validates :username, :first_name, :last_name, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create, message: "Must be valid email format(example: example@gmail.com)" }
  validates :email, uniqueness: true
  validates :username, :first_name, :last_name, length: { maximum: 100 }
  validates :username, :uniqueness => { :case_sensitive => false }

  def create_profiles
    profile = self.build_profile
    profile.save
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

end
