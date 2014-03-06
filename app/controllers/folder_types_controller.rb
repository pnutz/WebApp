class FolderTypesController < ApplicationController
	load_and_authorize_resource
	skip_load_resource only: [:create]
  before_action :set_folder_type, only: [:show, :edit, :update, :destroy]

  # GET /folder_types
  # GET /folder_types.json
  def index
    @folder_types = current_user.folder_types
  end

  # GET /folder_types/1
  # GET /folder_types/1.json
  def show
  end

  # GET /folder_types/new
  def new
    @folder_type = FolderType.new
  end

  # GET /folder_types/1/edit
  def edit
  end

  # POST /folder_types
  # POST /folder_types.json
  def create
    @folder_type = current_user.folder_types.new(folder_type_params)
		
    respond_to do |format|
      if @folder_type.save
        format.html { redirect_to @folder_type, notice: 'Folder type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @folder_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @folder_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folder_types/1
  # PATCH/PUT /folder_types/1.json
  def update
    respond_to do |format|
      if @folder_type.update(folder_type_params)
        format.html { redirect_to @folder_type, notice: 'Folder type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @folder_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folder_types/1
  # DELETE /folder_types/1.json
  def destroy
    @folder_type.destroy
    respond_to do |format|
      format.html { redirect_to folder_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder_type
      @folder_type = FolderType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_type_params
      params[:folder_type].permit(:id, :user_id, :name)
    end
end
