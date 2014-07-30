class DocumentsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource only: [:create]
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    is_snapshot = params[:is_snapshot]
    @documents = {}

    current_user.receipts.each do |receipt|
      receipt.documents.each do |document|
        if ((is_snapshot != nil && document.is_snapshot == is_snapshot.to_bool) || is_snapshot == nil)
          @documents[document.receipt_id] =
            { :id => document.id, :filename => document.file_file_name, :content_type => document.file_content_type, :updated_at => document.file_updated_at, :path => document.file.url }
        end
      end
    end

    render :status=>200, :json=>@documents
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    style = params[:style] ? params[:style] : 'original'
    @document = Document.find(params[:id])
    send_file @document.file.path(style), :filename => @document.file_file_name, :type => @document.file_content_type, :disposition => 'inline'
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render action: 'show', status: :created, location: @document }
      else
        format.html { render action: 'new' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:is_snapshot, :receipt_id, :user_id)
    end
end
