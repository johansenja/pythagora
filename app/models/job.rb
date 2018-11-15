class Job < ApplicationRecord
  belongs_to :developer, class_name: :User, foreign_key: :developer_id, optional: true
  belongs_to :buyer, class_name: 'User'
  has_many :bids

  validates :name, presence: true
  validates :description, presence: true
end
