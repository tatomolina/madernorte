class Vendor < ApplicationRecord
  has_many :orders, inverse_of: :vendor
end
