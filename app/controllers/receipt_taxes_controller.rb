class ReceiptTaxesController < ApplicationController
	load_and_authorize_resource
  before_action :set_receipt_tax, only: [:show, :edit, :update, :destroy]

  # GET /receipt_taxes
  # GET /receipt_taxes.json
  def index
    @receipt_taxes = ReceiptTax.all
  end

  # GET /receipt_taxes/1
  # GET /receipt_taxes/1.json
  def show
  end

  # GET /receipt_taxes/new
  def new
    @receipt_tax = ReceiptTax.new
  end

  # GET /receipt_taxes/1/edit
  def edit
  end

  # POST /receipt_taxes
  # POST /receipt_taxes.json
  def create
    @receipt_tax = ReceiptTax.new(receipt_tax_params)

    respond_to do |format|
      if @receipt_tax.save
        format.html { redirect_to @receipt_tax, notice: 'Receipt tax was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipt_tax }
      else
        format.html { render action: 'new' }
        format.json { render json: @receipt_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipt_taxes/1
  # PATCH/PUT /receipt_taxes/1.json
  def update
    respond_to do |format|
      if @receipt_tax.update(receipt_tax_params)
        format.html { redirect_to @receipt_tax, notice: 'Receipt tax was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipt_taxes/1
  # DELETE /receipt_taxes/1.json
  def destroy
    @receipt_tax.destroy
    respond_to do |format|
      format.html { redirect_to receipt_taxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_tax
      @receipt_tax = ReceiptTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_tax_params
      params.require(:receipt_tax).permit(:receipt_id, :tax_type_id, :cost)
    end
end
