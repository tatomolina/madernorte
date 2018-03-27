class NotesController < ApplicationController

  def index
    @notes = Note.all.order(created_at: :desc).page(params[:page]).per(10)
    authorize Note
  end

  def new
    @note = Note.new
    authorize @note
  end

  def create
    @note = Note.new(note_params)
    authorize @note

    if @note.save
      flash[:notice] = "Nota creada correctamente"
      redirect_to notes_path
    else
      flash[:alert] = "#{@note.errors.count} error no permitio crear este nota: "
      @note.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @note.errors.full_messages.last == msg
      end
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
    authorize @note
  end

  def update
    @note = Note.find(params[:id])
    authorize @note

    if @note.update(note_params)
      flash[:notice] = "Note actualizada correctamente"
      redirect_to note_path(params[:id])
    else
      flash[:alert] = "#{@note.errors.count} error no permitio actualizar esta notee: "
      @note.errors.full_messages.each do |msg|
        flash[:alert] << "#{msg}"
        flash[:alert] << ", " unless @order.errors.full_messages.last == msg
      end
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    authorize @note
    @note.destroy

    redirect_to notes_path
  end


  private

  def note_params
    params.require(:note).permit(:description)
  end

end
