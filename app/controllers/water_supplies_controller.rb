class WaterSuppliesController < ApplicationController
  before_action :set_water_supply, only: [:show, :edit, :update, :destroy]

  # GET /water_supplies
  def index
    @water_supplies = WaterSupply.all
  end

  # GET /water_supplies/1
  def show
  end

  # GET /water_supplies/new
  def new
    @water_supply = WaterSupply.new
  end

  # GET /water_supplies/1/edit
  def edit
  end

  # POST /water_supplies
  def create
    @water_supply = WaterSupply.new(water_supply_params)

    respond_to do |format|
      if @water_supply.save
        format.html { redirect_to @water_supply, notice: 'Water supply was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /water_supplies/1
  # PATCH/PUT /water_supplies/1.json
  def update
    respond_to do |format|
      if @water_supply.update(water_supply_params)
        format.html { redirect_to @water_supply, notice: 'Water supply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /water_supplies/1
  # DELETE /water_supplies/1.json
  def destroy
    @water_supply.destroy
    respond_to do |format|
      format.html { redirect_to water_supplies_url, notice: 'Water supply was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_supply
      @water_supply = WaterSupply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_supply_params
      params.require(:water_supply).permit(:provider, :house_id)
    end
end
