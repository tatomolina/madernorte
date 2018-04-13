class ClientsController < ApplicationController

  def index
    @clients = Client.search(params[:term])
    @orders = Order.search(params[:term])
    if !@orders.nil?
      @result = @clients + @orders
      @result = Kaminari.paginate_array(@result).page(params[:page]).per(10)
    else
      @result = @clients.page(params[:page]).per(10)
    end
    authorize Client
  end

  def show
    @client = Client.find(params[:id])
    @orders = @client.orders.order(created_at: :desc)
    @orders = Kaminari.paginate_array(@orders).page(params[:page]).per(10)
    authorize @client
  end

  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    authorize @client

    respond_to do |format|
      if @client.save
        format.html {
          flash[:notice] = "Cliente creado correctamente"
          redirect_to clients_path
        }
        format.js
      else
        flash[:alert] = "#{@client.errors.count} error no permitio crear este cliente: "
        @client.errors.full_messages.each do |msg|
          flash[:alert] << "#{msg}"
          flash[:alert] << ", " unless @client.errors.full_messages.last == msg
        end
        format.html { render 'new' }
        format.js
      end
    end
  end

  def edit
    @client = Client.find(params[:id])
    authorize @client
  end

  def update
    @client = Client.find(params[:id])
    authorize @client

    if @client.update(client_params)
      flash[:notice] = "Pedido actualizado correctamente"
      redirect_to client_path(params[:id])
    else
      flash[:alert] = "#{@client.errors.count} error no permitio actualizar este cliente: "
      @client.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @client.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    authorize @client
    @client.destroy

    redirect_to clients_path
  end


  private

  def client_params
    params.require(:client).permit(:name, :term)
  end

end
