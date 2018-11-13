class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  has_many :jobs
  has_many :bids
  has_many :userskills, foreign_key: :developer_id
  has_many :skills, through: :userskills
  validates :first_name, presence: true
  validates :last_name, presence: true
  # one or more of anything except @; then @; then one or more of anything but @ or .;
  # one or more of anything except @
  validates :email, format: { with: /[^@]{1,}\@[^@.]{1,}\.[^@]{1,}/ }, uniqueness: true
end
