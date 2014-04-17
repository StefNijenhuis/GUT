class UsertestsController < ApplicationController
	def new
		@test = Usertest.new()
	end

	def create
		@test = Usertest.new(test_params)
		@test.status = 0

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

	def index
		@tests = Usertest.all()
	end

	def edit
		@test = Usertest.find(params[:id])
	end

	def show
		@test = Usertest.find(params[:id])
	end


private
  def test_params
    params.require(:usertest).permit(:title, :introtext, :start_date, :end_date)
  end


end
