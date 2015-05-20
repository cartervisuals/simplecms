class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to(:action => 'index')
      flash[:notice] = "Section created successfully"
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      redirect_to(:action => 'show', :id => @section.id)
      flash[:notice] = "Subject updated successfully"
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Ssection.find(params[:id])
    flash[:notice] = "Section '#{section.name}' deleted successfully"
    @section.destroy
    redirect_to(:action => 'index')
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end

end

    
