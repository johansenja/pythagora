class Userskill < ApplicationRecord
  belongs_to :skill
  belongs_to :developer, class_name: 'User'
  validates :developer_id, uniqueness: { scope: :skill_id }
end
