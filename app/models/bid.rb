class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :developer, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
end
