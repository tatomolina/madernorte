class AreasController < ApplicationController

  def index
    @areas = Area.all
    authorize Area
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
    authorize @area
  end

  def create
    @area = Area.new(area_params)
    authorize @area

    if @area.save
      flash[:notice] = "Area creada correctamente"
      redirect_to areas_path
    else
      flash[:alert] = "#{@area.errors.count} error no permitio crear este areae: "
      @area.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @area.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @area = Area.find(params[:id])
    authorize @area
  end

  def update
    @area = Area.find(params[:id])
    authorize @area

    if @area.update(area_params)
      flash[:notice] = "Area actualizada correctamente"
      redirect_to areas_path
    else
      flash[:alert] = "#{@order.errors.count} error no permitio actualizar esta areae: "
      @order.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @order.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end

  def destroy
    @area = Area.find(params[:id])
    authorize @area
    @area.destroy

    redirect_to areas_path
  end


  private

  def area_params
    params.require(:area).permit(:name)
  end

end
