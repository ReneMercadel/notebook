class NotesController < ApplicationController
  before_action :set_note, only: %i[show]
  def index
    @notes = Note.all
  end

  def show

  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    respond_to do |format|
      if @note.save
        format.html {redirect_to note_url(@note), notice: "Note was created successfully"}
      else
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content)
    end

end
