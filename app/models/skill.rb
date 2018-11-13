class Skill < ApplicationRecord
  has_many :userskills
  has_many :developers, through: :userskills, source: :developer
  validates :name, presence: true, allow_nil: false
end
