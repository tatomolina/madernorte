class CartsController < ApplicationController

  def show
    @delivery_items = current_delivery.delivery_items
  end

  def done
      session.delete(:delivery_id)
      redirect_to root_path
  end

end
