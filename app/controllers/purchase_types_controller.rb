class PurchaseTypesController < ApplicationController
	load_and_authorize_resource
  before_action :set_purchase_type, only: [:show, :edit, :update, :destroy]

  # GET /purchase_types
  # GET /purchase_types.json
  def index
    @purchase_types = PurchaseType.all
  end

  # GET /purchase_types/1
  # GET /purchase_types/1.json
  def show
  end

  # GET /purchase_types/new
  def new
    @purchase_type = PurchaseType.new
  end

  # GET /purchase_types/1/edit
  def edit
  end

  # POST /purchase_types
  # POST /purchase_types.json
  def create
    @purchase_type = PurchaseType.new(purchase_type_params)

    respond_to do |format|
      if @purchase_type.save
        format.html { redirect_to @purchase_type, notice: 'Purchase type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @purchase_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @purchase_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_types/1
  # PATCH/PUT /purchase_types/1.json
  def update
    respond_to do |format|
      if @purchase_type.update(purchase_type_params)
        format.html { redirect_to @purchase_type, notice: 'Purchase type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_types/1
  # DELETE /purchase_types/1.json
  def destroy
    @purchase_type.destroy
    respond_to do |format|
      format.html { redirect_to purchase_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_type
      @purchase_type = PurchaseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_type_params
      params.require(:purchase_type).permit(:name)
    end
end
