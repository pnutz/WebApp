class ReceiptCategoriesController < ApplicationController
	load_and_authorize_resource
  before_action :set_receipt_category, only: [:show, :edit, :update, :destroy]

  # GET /receipt_categories
  # GET /receipt_categories.json
  def index
    @receipt_categories = ReceiptCategory.all
  end

  # GET /receipt_categories/1
  # GET /receipt_categories/1.json
  def show
  end

  # GET /receipt_categories/new
  def new
    @receipt_category = ReceiptCategory.new
  end

  # GET /receipt_categories/1/edit
  def edit
  end

  # POST /receipt_categories
  # POST /receipt_categories.json
  def create
    @receipt_category = ReceiptCategory.new(receipt_category_params)

    respond_to do |format|
      if @receipt_category.save
        format.html { redirect_to @receipt_category, notice: 'Receipt category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipt_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @receipt_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipt_categories/1
  # PATCH/PUT /receipt_categories/1.json
  def update
    respond_to do |format|
      if @receipt_category.update(receipt_category_params)
        format.html { redirect_to @receipt_category, notice: 'Receipt category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipt_categories/1
  # DELETE /receipt_categories/1.json
  def destroy
    @receipt_category.destroy
    respond_to do |format|
      format.html { redirect_to receipt_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt_category
      @receipt_category = ReceiptCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_category_params
      params.require(:receipt_category).permit(:category)
    end
end
