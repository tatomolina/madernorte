class Article < ApplicationRecord
  belongs_to :order, optional: true
  resourcify
end
