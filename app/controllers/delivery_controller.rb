class DeliveryController < ApplicationController

  def index
    @deliveries = Delivery.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @delivery = Delivery.find(params[:id])
  end

end
