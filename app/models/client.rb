class Client < ApplicationRecord
  validates :name, :presence => true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :orders, inverse_of: :client
  resourcify

  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%")
    else
      order(:name)
    end
  end

  def orders_not_delivered
    self.orders.select{|x| !(x.delivered?) }
  end
end
