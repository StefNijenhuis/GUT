class UsertestsController < ApplicationController
	def new
	end

	def create
		@test = Usertest.new(test_params)

		#abort(@test.inspect)
		@test.status = 0
		@test.save
	end

	def delete
	end

	def update
	end

	def index
		@tests = Usertest.all()
	end

	def edit
			@test = Usertest.find(:id)
	end

	def show
	end

	private
  def test_params
    params.require(:usertest).permit(:title, :introtext, :start_date, :end_date)
  end


end
