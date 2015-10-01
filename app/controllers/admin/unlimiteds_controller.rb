class Admin::UnlimitedsController < Admin::ApplicationController
  def index
    @unlimiteds = Unlimited.page(params[:page]).per(20)
  end

  def show
    @unlimited = Unlimited.find(params[:id])
  end

  def new
    @unlimited = Unlimited.new
  end

  def create
    @unlimited = Unlimited.new(params[:unlimited])
    if @unlimited.save
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
    if @unlimited.update_attributes(params[:unlimited])
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
end
