class Order < ApplicationRecord
  validates :client, presence: true
  validates :direction, presence: true
  belongs_to :client
  belongs_to :area
  belongs_to :priority
  belongs_to :user
  belongs_to :vendor

  has_many :articles, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :articles, allow_destroy: true,
   reject_if: :reject_posts

  resourcify

  def self.not_completed
    self.all.order(created_at: :desc).select { |x| !x.done? || !x.delivered? || !x.invoiced? }
  end

  def self.worker_not_completed
    self.all.order(priority_id: :desc, created_at: :desc).select { |x| (!x.done?) && x.process? }
  end

  def reject_posts(attributes)
    attributes['quantity'].blank? && attributes['width'].blank? && attributes['height'].blank?
  end

  def done?
    ((self.articles.select{|x| x.done }.count == self.articles.count) && (self.common_articles.select{|x| x.done }.count == self.common_articles.count))
  end

  def delivered?
    ((self.articles.select{|x| x.delivered }.count == self.articles.count) && (self.common_articles.select{|x| x.delivered }.count == self.common_articles.count))
  end

  def invoiced?
    ((self.articles.select{|x| x.invoiced }.count == self.articles.count) && (self.common_articles.select{|x| x.invoiced }.count == self.common_articles.count))
  end

  def process?
    ((self.articles.select{|x| x.process }.count >= 1) || (self.common_articles.select{|x| x.process }.count >= 1))
  end

  def to_process
    self.articles.select{|x| x.process }
  end

end
