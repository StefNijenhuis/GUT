class AssociationTestsController < ApplicationController
  before_action :set_association_test, only: [:maketest, :show, :edit, :update, :destroy]

  # GET /associaton_tests
  # GET /association_tests.json
  def index
    @association_tests = AssociationTest.all
  end

  # GET /association_tests/1
  # GET /association_tests/1.json
  def show
    @association_attachments = @association_test.association_attachments.all
  end

  def maketest
    @association_attachments = @association_test.association_attachments.all
  end

  # GET /association_tests/new
  def new
    @association_test = AssociationTest.new
    @association_attachment = @association_test.association_attachments.build
  end

  # GET /association_tests/1/edit
  def edit
  end

  # POST /association_tests
  # POST /association_tests.json
  def create
    @association_test = AssociationTest.new(association_test_params)

    respond_to do |format|
      if @association_test.save
        params[:association_attachments]['image'].each do |a|
          @association_attachment = @association_test.association_attachments.create!(:image => a, :association_test_id => @association_test.id)
        end
        format.html { redirect_to @association_test, notice: 'Association test was successfully created.' }
        format.json { render action: 'show', status: :created, location: @association_test }
      else
        format.html { render action: 'new' }
        format.json { render json: @association_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /association_tests/1
  # PATCH/PUT /association_tests/1.json
  def update
    respond_to do |format|
      if @association_test.update(association_test_params)
        format.html { redirect_to @association_test, notice: 'Association test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @association_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /association_tests/1
  # DELETE /association_tests/1.json
  def destroy
    @association_test.destroy
    respond_to do |format|
      format.html { redirect_to association_tests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association_test
      @association_test = AssociationTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_test_params
      params.require(:association_test).permit(:title, :description, post_attachments_attributes: [:id, :association_test_id, :image])
    end
end