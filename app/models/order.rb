class Order < ApplicationRecord
  validates :client, :presence => true
  validates :direction, :presence => true
  belongs_to :client
  belongs_to :area

  has_many :articles, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :articles, allow_destroy: true,
   reject_if: :reject_posts

  resourcify

  def reject_posts(attributes)
    attributes['quantity'].blank? && attributes['width'].blank? && attributes['height'].blank?
  end

  def done?
    self.articles.select{|x| x.done == true }.count == self.articles.count
  end

  def delivered?
    self.articles.select{|x| x.delivered == true }.count == self.articles.count
  end

  def invoiced?
    self.articles.select{|x| x.invoiced == true }.count == self.articles.count
  end
end
