class CartsController < ApplicationController

  def show
    @delivery_items = current_delivery.delivery_items
  end

end
