class ReceiptsController < ApplicationController
  load_and_authorize_resource
	skip_load_resource only: [:create]
	before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    @receipts = current_user.receipts
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
    @receipt_items = @receipt.receipt_items;
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    @receipt.folder_id = params[:folder_id]
  end

  # GET /receipts/1/edit
  def edit
  end

  # POST /receipts
  # POST /receipts.json
  def create
    newReceipt = receipt_params

    if (newReceipt[:date] == nil && newReceipt[:numeric_date] != nil)
      newReceipt[:date] = Time.at(newReceipt[:numeric_date].to_i)
    end

    newReceipt[:date] = Timeliness.parse(newReceipt[:date], :format => 'mm/dd/yyyy')

    if (newReceipt[:receipt_items_attributes] != nil)
      newReceipt[:receipt_items_attributes].values.each do |item|
        # only look at receipt items that will be created
        if (item[:destroy] == nil || item[:_destroy] == "false")
          # create new ItemType if it does not exist, set item_type_id if it exists
          type = ItemType.find_by name: item[:itemtype]
          if (type == nil)
            type = ItemType.create(name: item[:itemtype])
          end
          item[:item_type_id] = type.id
        end
      end
    end

    if (newReceipt[:receipt_taxes_attributes] != nil)
      newReceipt[:receipt_taxes_attributes].values.each do |tax|
        # only look at receipt taxes that will be created
        if (tax[:destroy] == nil || tax[:_destroy] == "false")
          # create new TaxType if it does not exist, set tax_type_id if it exists
          type = TaxType.find_by name: tax[:taxtype]
          if (type == nil)
            type = TaxType.create(name: tax[:taxtype])
          end
          tax[:tax_type_id] = type.id
        end
      end
    end

    if (newReceipt[:documents_attributes] != nil)
      newReceipt[:documents_attributes].values.each do |document|
        if (document[:is_snapshot])
          document[:file] = Document.decode_base64_image(document[:data])
          # convert png to jpg through filename
          document[:file_file_name] = "snapshot.jpg"
          document[:user_id] = newReceipt[:user_id]
          # else - add uploads when implementation required
        end
      end
    end

    if (newReceipt[:vendor_name] != "")
      # try to find existing vendor
      vendor = Vendor.find_by name: newReceipt[:vendor_name]
      # if we don't have a vendor by this name then create it
      if (vendor == nil)
        vendor = Vendor.create(name: newReceipt[:vendor_name])
      end
      newReceipt[:vendor_id] = vendor.id
    end
    receiptTags = nil
    # if the receipt has a list of tag names
    if (newReceipt[:tag_names] != nil)
      receiptTags = newReceipt[:tag_names]
    end

    # remove vendor_name, numeric_date, nested itemtype key, and nested data key before creating receipt, since it is not in model
    newReceipt.delete(:vendor_name)
    newReceipt.delete(:numeric_date)
    newReceipt.delete(:tag_names)
    newReceipt = Hash[newReceipt.map {|k,v| [k,(v.respond_to?(:except) ? Hash[v.map {|x,y| [x,(y.respond_to?(:except) ? y.except(:itemtype):y)] }]:v)] }]
    newReceipt = Hash[newReceipt.map {|k,v| [k,(v.respond_to?(:except) ? Hash[v.map {|x,y| [x,(y.respond_to?(:except) ? y.except(:data):y)] }]:v)] }]

    @receipt = current_user.receipts.new(newReceipt)
    respond_to do |format|
      if @receipt.save
        # if the receipt has tag names then associate them
        if (receiptTags != nil)
          receiptTags.each do |name|
            newTag = Tag.find_or_create_by(name: name)
            @receipt.tags<<newTag
          end
        end

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

      updateReceipt = receipt_params

      if (updateReceipt[:date] == nil && updateReceipt[:numeric_date] != nil)
        updateReceipt[:date] = Time.at(updateReceipt[:numeric_date].to_i)
      end

      updateReceipt[:date] = Timeliness.parse(updateReceipt[:date], :format => 'mm/dd/yyyy')

      if (updateReceipt[:receipt_items_attributes] != nil)
        updateReceipt[:receipt_items_attributes].values.each do |item|
          # only look at receipt items that will be created
          if (item[:destroy] == nil || item[:_destroy] == "false")
            # create new ItemType if it does not exist, set item_type_id if it exists
            type = ItemType.find_by name: item[:itemtype]
            if (type == nil)
              type = ItemType.create(name: item[:itemtype])
            end
            item[:item_type_id] = type.id
          end
        end
      end

    if (updateReceipt[:receipt_taxes_attributes] != nil)
      updateReceipt[:receipt_taxes_attributes].values.each do |tax|
        # only look at receipt taxes that will be created
        if (tax[:destroy] == nil || tax[:_destroy] == "false")
          # create new TaxType if it does not exist, set tax_type_id if it exists
          type = TaxType.find_by name: tax[:taxtype]
          if (type == nil)
            type = TaxType.create(name: tax[:taxtype])
          end
          tax[:tax_type_id] = type.id
        end
      end
    end

      # try to find existing vendor
      vendor = Vendor.find_by name: updateReceipt[:vendor_name]
      # if we don't have a vendor by this name then create it
      if (vendor == nil)
        vendor = Vendor.create(name: updateReceipt[:vendor_name])
      end
      updateReceipt[:vendor_id] = vendor.id

      # remove vendor_name, numeric_date, nested itemtype key, and nested data key before creating receipt, since it is not in model
      updateReceipt.delete(:vendor_name)
      updateReceipt.delete(:numeric_date)
      updateReceipt = Hash[updateReceipt.map {|k,v| [k,(v.respond_to?(:except) ? Hash[v.map {|x,y| [x,(y.respond_to?(:except) ? y.except(:itemtype):y)] }]:v)] }]
      updateReceipt = Hash[updateReceipt.map {|k,v| [k,(v.respond_to?(:except) ? Hash[v.map {|x,y| [x,(y.respond_to?(:except) ? y.except(:data):y)] }]:v)] }]

      if @receipt.update(updateReceipt)
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:date,
                                      :numeric_date,
                                      :total,
                                      :transaction_number,
                                      :category_id,
                                      :subtotal,
                                      :folder_id,
                                      :note,
                                      :vendor_id,
                                      :vendor_name,
                                      :currency_id,
                                      :user_id,
                                      :profile_id,
                                      tag_names: [],
                                      receipt_items_attributes: [ :id, :item_type_id, :itemtype, :cost, :quantity, :_destroy ],
                                      receipt_taxes_attributes: [ :id, :tax_type_id, :taxtype, :cost, :_destroy ],
                                      documents_attributes: [ :id, :is_snapshot, :data ])
    end
end
