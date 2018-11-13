class Job < ApplicationRecord
  has_one :developer, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  has_many :bids

  validates :name, presence: true
  validates :description, presence: true
end
