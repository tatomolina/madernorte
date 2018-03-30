class CommonArticle < ApplicationRecord
  validates :quantity, :presence => true
  belongs_to :order, optional: true

end
