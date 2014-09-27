class Api::ExoImagesController < Api::ApplicationController
  def index

    images = []
    (1..10).each do 
      images.push(ExoImage.searchable.skip(rand(ExoImage.searchable.count)).first)
    end

    @json_result.object = images


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
      redirect_to [:api, @exo_image], :notice => "Successfully created exo image."
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
      redirect_to [:api, @exo_image], :notice  => "Successfully updated exo image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @exo_image = ExoImage.find(params[:id])
    @exo_image.destroy
    redirect_to api_exo_images_url, :notice => "Successfully destroyed exo image."
  end
end
