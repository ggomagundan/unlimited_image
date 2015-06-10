class UnlimiteExosController < ApplicationController
  def index
    @image = ExoImage.searchable.skip(rand(ExoImage.searchable.count)).first
  end

  def show
    @unlimite_exo = UnlimiteExo.find(params[:id])
  end

  def new
    @unlimite_exo = UnlimiteExo.new
  end

  def create
    @unlimite_exo = UnlimiteExo.new(params[:unlimite_exo])
    if @unlimite_exo.save
      redirect_to @unlimite_exo, :notice => "Successfully created unlimite exo."
    else
      render :action => 'new'
    end
  end

  def edit
    @unlimite_exo = UnlimiteExo.find(params[:id])
  end

  def update
    @unlimite_exo = UnlimiteExo.find(params[:id])
    if @unlimite_exo.update_attributes(params[:unlimite_exo])
      redirect_to @unlimite_exo, :notice  => "Successfully updated unlimite exo."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @unlimite_exo = UnlimiteExo.find(params[:id])
    @unlimite_exo.destroy
    redirect_to unlimite_exos_url, :notice => "Successfully destroyed unlimite exo."
  end
end
