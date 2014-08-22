class TagsController < ApplicationController
  load_and_authorize_resource
	skip_load_resource only: [:create]
	before_action :set_model, only: [:create]

  # GET /tags/:type/:id
  # :type - the type of data to associate the tag with
  #         ie. receipt_item, user, receipt 
  # :id - the id of the type_item to be associated
  def index
    case params[:type]
    when "user"
      @model = User
    when "receipt"
      @model = Receipt
    when "receipt_item"
      @model = ReceiptItem
    else
      # TODO: handle properly
      puts "Received Invalid Parameter"
      render status: 400 
    end
    @tags = @model.find(params[:id]).tags
  end

  # PUT /tags/:type/:id
  # :type - the type of data to associate the tag with
  #         ie. receipt_item, user, receipt 
  # :id - the id of the type_item to be associated
  def create
    _type_item = nil
    if (params[:name] != nil)
      # retrieve type_item from database 
      _type_item = @model.find(params[:id])
    end

    respond_to do |format|
      if (_type_item != nil)
        @tag = Tag.where(name: params[:name]).first_or_create
        # associate the tag with the item
        puts @tag
        _type_item.tags<<@tag
        format.json { render json: @tag.errors, status: 200 }
      else
        format.json { render json: @tag.errors, status: 500 }
      end
    end
  end

  # DELETE /tags/:type/:id/:tag_id
  # :type - the type of data to associate the tag with
  #         ie. receipt_item, user, receipt 
  # :id - the id of the type_item 
  # :tag_id - the id of the tag to be removed from the type_item
  def delete
    if (params[:name] != nil)
      _type_item = @model.find(params[:id])
      if (_type_item != nil)
        @tag = Tag.find(params[:tag_id])
        _type_item.delete(@tag)
        render status: 200
      end
      render status: 404 
    else
      render status: 500
    end
  end

  private

  def set_model
    case params[:type]
    when "user"
      @model = User
    when "receipt"
      @model = Receipt
    when "receipt_item"
      @model = ReceiptItem
    else
      # TODO: handle properly
      puts "Received Invalid Parameter"
      render status: 400 
    end
  end
end
