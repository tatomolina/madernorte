class Article < ApplicationRecord
  validates :quantity, :presence => true
  belongs_to :order, optional: true
  belongs_to :article_state

  resourcify
end
