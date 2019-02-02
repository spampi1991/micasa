class GasSuppliesController < ApplicationController
  before_action :set_gas_supply, only: [:show, :edit, :update, :destroy]

  # GET /gas_supplies
  def index
    @gas_supplies = GasSupply.all
  end

  # GET /gas_supplies/1
  def show
  end

  # GET /gas_supplies/new
  def new
    @gas_supply = GasSupply.new
  end

  # GET /gas_supplies/1/edit
  def edit
  end

  # POST /gas_supplies
  def create
    @gas_supply = GasSupply.new(gas_supply_params)

    respond_to do |format|
      if @gas_supply.save
        format.html { redirect_to @gas_supply, notice: 'Gas supply was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /gas_supplies/1
  def update
    respond_to do |format|
      if @gas_supply.update(gas_supply_params)
        format.html { redirect_to @gas_supply, notice: 'Gas supply was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /gas_supplies/1
  def destroy
    @gas_supply.destroy
    respond_to do |format|
      format.html { redirect_to gas_supplies_url, notice: 'Gas supply was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gas_supply
      @gas_supply = GasSupply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gas_supply_params
      params.require(:gas_supply).permit(:provider, :house_id)
    end
end
