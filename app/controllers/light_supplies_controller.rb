class LightSuppliesController < ApplicationController
  before_action :set_light_supply, only: [:show, :edit, :update, :destroy]

  # GET /light_supplies
  def index
    @light_supplies = LightSupply.all
  end

  # GET /light_supplies/1
  def show
  end

  # GET /light_supplies/new
  def new
    @light_supply = LightSupply.new
  end

  # GET /light_supplies/1/edit
  def edit
  end

  # POST /light_supplies
  def create
    @light_supply = LightSupply.new(light_supply_params)

    respond_to do |format|
      if @light_supply.save
        format.html { redirect_to @light_supply, notice: 'Light supply was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /light_supplies/1
  # PATCH/PUT /light_supplies/1.json
  def update
    respond_to do |format|
      if @light_supply.update(light_supply_params)
        format.html { redirect_to @light_supply, notice: 'Light supply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /light_supplies/1
  # DELETE /light_supplies/1.json
  def destroy
    @light_supply.destroy
    respond_to do |format|
      format.html { redirect_to light_supplies_url, notice: 'Light supply was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_light_supply
      @light_supply = LightSupply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def light_supply_params
      params.require(:light_supply).permit(:provider, :house_id)
    end
end
