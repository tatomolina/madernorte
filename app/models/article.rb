class Article < ApplicationRecord
  validates :quantity, :presence => true
  validates :width, :presence => true
  validates :height, :presence => true
  belongs_to :order, optional: true

  resourcify
end
