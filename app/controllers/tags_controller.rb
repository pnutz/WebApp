class TagsController < ApplicationController
  load_and_authorize_resource
  before_action :set_type, only: [:create]

  # GET /tags/:type/:id
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
    end
    @tags = @model.find(params[:id]).tags
  end

  # PUT /tags/:type/:id
  def create
    if (params[:name] != nil)
      @tag = Tag.find_or_create_by(name: params[:name])
      _type_item = @model.find(params[:id])
      _item_type.tags<<@tag
      render status: 200
    else
      render status: 500
    end
  end

  def delete
  end

  private

  def set_type_all
    case params[:type]
    when "receipt"
      @model = Receipt
    when "receipt_item"
      @model = ReceiptItem
    else
      # TODO: handle properly
      puts "Received Invalid Parameter"
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end

end
