class Area < ApplicationRecord
  validates :name, :presence => true
  has_many :orders, inverse_of: :Area

  def not_delivered
    self.orders.select{|x| x.delivered? == false}
  end
end
