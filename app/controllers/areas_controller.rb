class AreasController < ApplicationController
  def index
    @areas = Area.all
  end

  def show
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new
    @area.title = params[:area][:title]
    @area.body = params[:area][:body]

    if @area.save
      flash[:notice] = "Area was created successfully."
      redirect_to @area
    else
      flash.now[:alert] = "There was an error creating the area. Please try again."
      render :new
    end
  end

  def edit
  end
end
