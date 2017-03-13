class LibrariesController < ApplicationController

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
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
  end

  def edit
    library_id = params[:id]
    library = Library.find_by_id(library_id)
    redirect_to library_path(library)
  end

  def update
    library_id = params[:id]
    library = Library.find_by_id(library_id)

    library.update_attributes(library_params)

    redirect_to library_path(library)
  end

  def destroy
    library_id = params[:id]
    library = Library.find_by_id(library_id)

    library.destroy

    redirect_to library_path
  end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end


end
