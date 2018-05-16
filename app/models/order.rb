class Order < ApplicationRecord
  validates :client, presence: true
  belongs_to :client
  belongs_to :area
  belongs_to :priority
  belongs_to :user
  belongs_to :vendor

  has_many :delivery_items
  has_many :articles, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :articles, allow_destroy: true,
   reject_if: :reject_posts

  resourcify

  def reject_posts(attributes)
    attributes['quantity'].blank?
  end

  def self.search(term)
    if term
      where('common_client ILIKE ?', "%#{term}%")
    end
  end

  def self.not_completed
    self.all.order(created_at: :desc).select { |x| !x.delivered? || !x.invoiced? || !x.payed? }
    # Tengo q cambiar esto
    #self.where("payed = ? OR invoiced = ? OR delivered = ?", false, false, false)
  end

  def self.worker_not_completed
    self.all.order(priority_id: :desc, created_at: :desc).select { |x| x.process? }
  end

  def state
      if self.delivered?
        "Entregado"
      elsif self.done?
        "Procesado"
      elsif (self.articles.select{|x| x.article_state.name == "Cancelado" }.count == self.articles.count)
        "Cancelado"
      else
        "En Poceso"
      end
  end

  def done?
    (self.articles_done.count >= 1) && (self.articles.select{|x| (x.article_state.name == "Entregado") || x.article_state.name == "Procesado"|| x.article_state.name == "Cancelado" }.count == self.articles.count)
  end

  def delivered?
    self.articles_delivered.count >= 1 && self.articles.select{|x| (x.article_state.name == "Entregado") || x.article_state.name == "Cancelado" }.count == self.articles.count
  end

  def invoiced?
    self.articles.select{|x| x.invoiced }.count == self.articles.count
  end

  def payed?
    self.articles.select{|x| x.payed }.count == self.articles.count
  end

  def on_delivery?
    self.article_on_delivery.count > 0
  end

  def process?
    self.to_process.count >= 1
  end

  def articles_done
    self.articles.select{|x| x.article_state.name == "Procesado" }
  end

  def to_process
    self.articles.select{|x| x.article_state.name == "Procesar" }
  end

  def articles_on_delivery
    self.articles.select{|x| x.article_state.name == "En Camion" }
  end

  def articles_delivered
    self.articles.select{|x| x.article_state.name == "Entregado" }
  end

end
