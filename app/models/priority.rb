class Priority < ApplicationRecord
  has_many :orders, inverse_of: :priority
end
