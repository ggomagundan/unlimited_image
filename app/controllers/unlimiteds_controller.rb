class UnlimitedsController < ApplicationController
  before_action :set_unlimited, only: [:show, :edit, :update, :destroy]


  #include Five00px
  # GET /unlimiteds
  # GET /unlimiteds.json
  def index


    #@link_arr= []
    #(1..2).each do |i|
    #  Five00px.new.five_px(i)
   # end
    @image = Unlimited.skip(rand(Unlimited.count)).first

  end

  # GET /unlimiteds/1
  # GET /unlimiteds/1.json
  def show
  end

  # GET /unlimiteds/new
  def new
    @unlimited = Unlimited.new
  end

  # GET /unlimiteds/1/edit
  def edit
  end

  # POST /unlimiteds
  # POST /unlimiteds.json
  def create
    @unlimited = Unlimited.new(unlimited_params)

    respond_to do |format|
      if @unlimited.save
        format.html { redirect_to @unlimited, notice: 'Unlimited was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unlimited }
      else
        format.html { render action: 'new' }
        format.json { render json: @unlimited.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unlimiteds/1
  # PATCH/PUT /unlimiteds/1.json
  def update
    respond_to do |format|
      if @unlimited.update(unlimited_params)
        format.html { redirect_to @unlimited, notice: 'Unlimited was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unlimited.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unlimiteds/1
  # DELETE /unlimiteds/1.json
  def destroy
    @unlimited.destroy
    respond_to do |format|
      format.html { redirect_to unlimiteds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unlimited
      @unlimited = Unlimited.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unlimited_params
      params[:unlimited]
    end
end
