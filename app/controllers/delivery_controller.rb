class DeliveryController < ApplicationController

  def index
    @deliveries = Delivery.all.order(created_at: :desc).page(params[:page]).per(10)
    authorize Delivery
  end

  def show
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end

end
