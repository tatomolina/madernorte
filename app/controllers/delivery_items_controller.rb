class DeliveryItemsController < ApplicationController

  def create
    @delivery = current_delivery
    @delivery_item = @delivery.delivery_items.new(delivery_items_params)
    @delivery.save
    session[:delivery_id] = @delivery.id
  end

  def destroy

    @delivery = current_delivery
    @delivery_item = @delivery.delivery_items.find(params[:id])
    @delivery_item.destroy
    @delivery_items = @delivery.delivery_items
    respond_to do |format|
      format.html { redirect_to carts_path }
      format.js   { render :layout => false }
    end
  end

  private

  def delivery_items_params
      params.require(:delivery_item).permit(:order_id)
  end
end
