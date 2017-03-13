class LibrariesController < ApplicationController

  before_action :set_library, only: [:show, :update, :destroy, :edit]

  def index
    @libraries = Library.all
  end

  def new
    @library = Library.new
  end

  def create
    library = Library.create(library_params)

    if library.save
      redirect_to library_path(library)
    end
  end

  def show
    @library = set_library
  end

  def edit
    redirect_to library_path(set_library)
  end

  def update
    set_library.update_attributes(library_params)
    redirect_to library_path(library)
  end

  def destroy
    set_library.destroy
    redirect_to library_path
  end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

  def set_library
    library_id = params[:id]
    library = Library.find_by_id(library_id)
  end


end
