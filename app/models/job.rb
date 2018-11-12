class Job < ApplicationRecord
  has_one :developer, class_name: 'User'
  belongs_to :buyer, class_name: 'User'

  validates :name, presence: true
  validates :description, presence: true
end
