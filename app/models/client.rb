class Client < ApplicationRecord
  validates :name, :presence => true
  has_many :orders, inverse_of: :client
  resourcify

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      order(:name)
    end
  end
end
