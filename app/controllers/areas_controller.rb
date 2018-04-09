class AreasController < ApplicationController
  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new
    @area.title = params[:area][:title]
    @area.body = params[:area][:body]
    @area.url = params[:area][:url]

    if @area.save
      flash[:notice] = "Area was created successfully."
      redirect_to @area
    else
      flash.now[:alert] = "There was an error creating the area. Please try again."
      render :new
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    @area.title = params[:area][:title]
    @area.body = params[:area][:body]

    if @area.save
      flash[:notice] = "Area was updated."
      redirect_to @area
    else
      flash.now[:alert] = "There was an error saving the area. Please try again."
      render :edit
    end
  end

  def destroy
    @area = Area.find(params[:id])

    if @area.destroy
      flash[:notice] = "\"#{@area.title}\" was deleted successfully."
      redirect_to areas_path
    else
      flash.now[:alert] = "There was an error deleting the area."
      render :show
    end
  end
end
