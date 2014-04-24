class UsertestsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_test, only: [:show, :edit, :update, :destroy, :test]

	def new
		@test = Usertest.new()
	end

	def create
		@test = Usertest.new(test_params)
		@test.status = 0
		@test.user = current_user
		#abort(@test.inspect)

		if @test.save
			redirect_to @test
		else
			render 'new'
		end
	end

	def destroy
		#only able to delete if user made the test
		if current_user == @test.user
		  @test.destroy
		  redirect_to usertests_path
		else
		  redirect_to @test, notice: 'Je kunt deze test niet verwijderen.'
		end
	end

	def update
		if @test.update(test_params)
			redirect_to @test
		else
			render 'edit'
		end
	end

	def publish
		@p = Usertest.find(params[:id])
  		@p.toggle!(:status)  
	end

	def index
		@tests = Usertest.all()
	end

	def edit
	  if current_user != @test.user
	  	redirect_to @test, notice: 'Je kunt deze test niet bewerken.'
	  end
	end

	def show
		if current_user.id == @test.user_id
			@testmethod = Testmethod.find_by "id = ?", @test.method_id
		else
			redirect_to test_usertest_path
		end
	end

	def test
		
	end

	def saveParticipantData
		@participant = Participant.new(params[:userdata])

	    respond_to do |format|
	      if @participant.save
	        format.html { redirect_to @participant, notice: "Save process completed!" }
	        format.json { render json: @participant, status: :created, location: @participant }
	      else
	        format.html { 
	          flash.now[:notice]="Save proccess coudn't be completed!" 
	          render :new 
	        }
	        format.json { render json: @participant.errors, status: :unprocessable_entity}
	      end
	    end
	end

private
  def set_test
    @test = Usertest.find(params[:id])
  end

  def test_params
    params.require(:usertest).permit(:title, :introtext, :method_id, :start_date, :end_date, :status)
  end

  def participant_params
  	params.require(:userdata).permit(:browser, :os)
  end


end
