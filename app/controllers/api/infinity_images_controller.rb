class Api::InfinityImagesController < Api::ApplicationController
  def index
    images = []
    (1..10).each do 
      images.push(Unlimited.skip(rand(Unlimited.count)).first)
    end

    @json_result.object = images

  end

  def show
    @infinity_image = InfinityImage.find(params[:id])
  end

  def new
    @infinity_image = InfinityImage.new
  end

  def create
    @infinity_image = InfinityImage.new(params[:infinity_image])
    if @infinity_image.save
      redirect_to [:api, @infinity_image], :notice => "Successfully created infinity image."
    else
      render :action => 'new'
    end
  end

  def edit
    @infinity_image = InfinityImage.find(params[:id])
  end

  def update
    @infinity_image = InfinityImage.find(params[:id])
    if @infinity_image.update_attributes(params[:infinity_image])
      redirect_to [:api, @infinity_image], :notice  => "Successfully updated infinity image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @infinity_image = InfinityImage.find(params[:id])
    @infinity_image.destroy
    redirect_to api_infinity_images_url, :notice => "Successfully destroyed infinity image."
  end
end
