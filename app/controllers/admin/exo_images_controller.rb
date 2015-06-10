class Admin::ExoImagesController < Admin::ApplicationController
  def index
    @exo_images = ExoImage.all
  end

  def show
    @exo_image = ExoImage.find(params[:id])
  end

  def new
    @exo_image = ExoImage.new
  end

  def create
    @exo_image = ExoImage.new(params[:exo_image])
    if @exo_image.save
      redirect_to [:admin, @exo_image], :notice => "Successfully created exo image."
    else
      render :action => 'new'
    end
  end

  def edit
    @exo_image = ExoImage.find(params[:id])
  end

  def update
    @exo_image = ExoImage.find(params[:id])
    if @exo_image.update_attributes(params[:exo_image])
      redirect_to [:admin, @exo_image], :notice  => "Successfully updated exo image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @exo_image = ExoImage.find(params[:id])
    @exo_image.destroy
    redirect_to admin_exo_images_url, :notice => "Successfully destroyed exo image."
  end
end
