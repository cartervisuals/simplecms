class SubjectsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    #uses sorted which is a scope in the model
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to(:action => 'index')
      flash[:notice] = "Subject created successfully"
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      redirect_to(:action => 'show', :id => @subject.id)
      flash[:notice] = "Subject updated successfully"
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    flash[:notice] = "Subject '#{subject.name}' deleted successfully"
    @subject.destroy
    redirect_to(:action => 'index')
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visibility, :created_at)
  end

end
