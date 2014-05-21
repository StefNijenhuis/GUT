class AssociationAttachmentsController < ApplicationController
  before_action :set_association_attachment, only: [:show, :edit, :update, :destroy]

  # GET /association_attachments
  # GET /association_attachments.json
  def index
    @association_attachments = AssociationAttachment.all
  end

  # GET /association_attachments/1
  # GET /association_attachments/1.json
  def show
  end

  # GET /association_attachments/new
  def new
    @association_attachment = AssociationAttachment.new
  end

  # GET /association_attachments/1/edit
  def edit
  end

  # POST /association_attachments
  # POST /association_attachments.json
  def create
    @association_attachment = AssociationAttachment.new(association_attachment_params)

    respond_to do |format|
      if @association_attachment.save
        format.html { redirect_to @association_attachment, notice: 'Association attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @association_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @association_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /association_attachments/1
  # PATCH/PUT /association_attachments/1.json
  def update
    respond_to do |format|
      if @association_attachment.update(association_attachment_params)
        format.html { redirect_to @association_attachment, notice: 'Association attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @association_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /association_attachments/1
  # DELETE /association_attachments/1.json
  def destroy
    @association_attachment.destroy
    respond_to do |format|
      format.html { redirect_to association_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association_attachment
      @association_attachment = AssociationAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_attachment_params
      params.require(:association_attachment).permit(:association_test_id, :image)
    end
end
