class Article < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :width_measure
  belongs_to :height_measure
  resourcify
end
