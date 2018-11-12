class Userskill < ApplicationRecord
  belongs_to :skill
  belongs_to :developer, class_name: 'User'
end
