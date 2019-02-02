class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  def show
    unless params[:gas_supply_id].nil?
      @submit_url = gas_supply_invoices_path(params[:gas_supply_id])
    end
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    unless params[:gas_supply_id].nil?
      @submit_url = gas_supply_invoices_path(params[:gas_supply_id])
    end
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  def create
    @invoice = Invoice.new(invoice_params)
    unless params[:gas_supply_id].nil?
      @invoice.billable = GasSupply.find(params[:gas_supply_id])
    end

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
      else
        unless params[:gas_supply_id].nil?
          @submit_url = gas_supply_invoices_path(params[:gas_supply_id])
        end
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:amount, :emission_date, :due_date, :gas_supply_id)
    end
end
