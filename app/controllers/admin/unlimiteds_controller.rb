class Admin::UnlimitedsController < Admin::ApplicationController
  def index
    @unlimiteds = Unlimited.order("created_at desc").page(params[:page]).per(20)
  end

  def show
    @unlimited = Unlimited.find(params[:id])
  end

  def new
    @unlimited = Unlimited.new
  end

  def create
    @unlimited = Unlimited.new(img_params)
    if  @unlimited.save
      redirect_to [:admin, @unlimited], :notice => "Successfully created unlimited."
    else
      render :action => 'new'
    end
  end

  def edit
    @unlimited = Unlimited.find(params[:id])
  end

  def update
    @unlimited = Unlimited.find(params[:id])
    if @unlimited.update_attributes(img_params)
      redirect_to [:admin, @unlimited], :notice  => "Successfully updated unlimited."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @unlimited = Unlimited.find(params[:id])
    @unlimited.destroy
    redirect_to admin_unlimiteds_url, :notice => "Successfully destroyed unlimited."
  end

  private
  def img_params
    params.require(:unlimited).permit(:original_url, :image_url, :owner_name, :owner_link, :image_source, :cc_code)
  end
end
