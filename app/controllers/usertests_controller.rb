class UsertestsController < ApplicationController
	before_filter :authenticate_user!

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
		@test = Usertest.find(params[:id])
		@test.destroy

		redirect_to usertests_path
	end

	def update
		@test = Usertest.find(params[:id])
 
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
		@test = Usertest.find(params[:id])
	end

	def show
		@test = Usertest.find(params[:id])
		if current_user.id == @test.user_id
			@testmethod = Testmethod.find_by "id = ?", @test.method_id
		else
			redirect_to test_usertest_path
		end
	end

	def test
		@test = Usertest.find(params[:id])
	end


private
  def test_params
    params.require(:usertest).permit(:title, :introtext, :method_id, :start_date, :end_date, :status)
  end


end
