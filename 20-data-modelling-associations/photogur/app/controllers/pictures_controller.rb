class PicturesController < ApplicationController

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render :new
    end
  end

  def new
    @picture = Picture.new
  end

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if @picture.destroy
      redirect_to pictures_path
    else
      render :show
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:url, :title, :description)
  end
end
