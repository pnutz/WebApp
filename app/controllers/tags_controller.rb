class TagsController < ApplicationController
  load_and_authorize_resource

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
    if (params[:name] != nil)
      # retrieve type_item from database 
      _type_item = @model.find(params[:id])
      if (_type_item != nil)
        @tag = Tag.find_or_create_by(name: params[:name])
        # associate the tag with the item
        _item_type.tags<<@tag
        render status: 200
      end
      render status: 404
    else
      render status: 500
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
end
