class OrdersController < ApplicationController

  def index
    @orders = Order.all
    authorize Order
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
    @order.articles.build
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    authorize @order

    if @order.save
      flash[:notice] = "Pedido creado correctamente"
      redirect_to root_path
    else
      flash[:alert] = "#{@order.errors.count} errors prohibited this order from being saved: "
      @order.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @order.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
    @order.articles.build
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order

    if @order.update(order_params)
      flash[:notice] = "Pedido actualizado correctamente"
      redirect_to root_path
    else
      #If i cant update, i render again the edit view
      flash[:alert] = "#{@order.errors.count} errores no permitieron actualizar este pedido: "
      @order.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @order.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy

    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:direction, :client_id, :area_id,
      articles_attributes: [:id, :_destroy, :order_id, :quantity, :width, :height,
         :long, :description, :done, :delivered, :invoiced, :width_measure_id, :height_measure_id])
  end
end
