class Area < ApplicationRecord
  validates :name, :presence => true
  has_many :orders

  def not_delivered
    self.orders.select{|x| !x.delivered?}
  end

  def not_delivered_and_done
    self.orders.select{|x| x.done? && !x.delivered?}
  end
end
