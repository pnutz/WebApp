class ReceiptItemsController < ApplicationController
  before_action :set_receipt_item, only: [:show, :edit, :update, :destroy]

  # GET /receipt_items
  # GET /receipt_items.json
  def index
    @receipt_items = ReceiptItem.all
  end

  # GET /receipt_items/1
  # GET /receipt_items/1.json
  def show
  end

  # GET /receipt_items/new
  def new
    @receipt_item = ReceiptItem.new
  end

  # GET /receipt_items/1/edit
  def edit
  end

  # POST /receipt_items
  # POST /receipt_items.json
  def create
    @receipt_item = ReceiptItem.new(receipt_item_params)

    respond_to do |format|
      if @receipt_item.save
        format.html { redirect_to @receipt_item, notice: 'Receipt item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipt_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @receipt_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipt_items/1
  # PATCH/PUT /receipt_items/1.json
  def update
    respond_to do |format|
      if @receipt_item.update(receipt_item_params)
        format.html { redirect_to @receipt_item, notice: 'Receipt item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipt_items/1
  # DELETE /receipt_items/1.json
  def destroy
    @receipt_item.destroy
    respond_to do |format|
      format.html { redirect_to receipt_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_item
      @receipt_item = ReceiptItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_item_params
      params.require(:receipt_item).permit(:receipt_id, :item_type_id, :cost, :quantity, :is_credit)
    end
end
