class Article < ApplicationRecord
  validates :quantity, :presence => true
  belongs_to :order, optional: true

  resourcify
end
