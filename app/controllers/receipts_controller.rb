class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = Receipt.all
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # POST /receipts.json
  def create
    #Try to find existing vendor
    newReceipt = receipt_params
    vendor = Vendor.find_by name: newReceipt[:vendor_name]
    #if we don't have a vendor by this name then create it
    if (vendor == nil)
      vendor = Vendor.create(name: newReceipt[:vendor_name])
    end
    newReceipt[:vendor_id] = vendor.id
    newReceipt.delete(:vendor_name)

    @receipt = Receipt.new(newReceipt)

    update_receipt_total

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to @receipt, notice: 'Receipt was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipt }
      else
        format.html { render action: 'new' }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)

        update_receipt_total

        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Re-calculates receipt total based on receipt items. Requires before_action :set_receipt to use @receipt
    def update_receipt_total
      @receipt.total = 0
      @receipt.receipt_items.each do |item|
        if (item.is_credit == false)
          @receipt.total = @receipt.total + (item.cost * item.quantity)
        else
          @receipt.total = @receipt.total - (item.cost * item.quantity)
        end
      end
      @receipt.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:date, :total, :transaction_number, :purchase_type_id, :title, :folder_id, :note, :vendor_id, :vendor_name, :currency_id, receipt_items_attributes: [ :id, :item_type_id, :cost, :quantity, :is_credit, :_destroy ])
    end
end
