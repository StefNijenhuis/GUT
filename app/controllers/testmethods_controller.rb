class TestmethodsController < ApplicationController
	def new
		@method = Testmethod.new()
	end

	def create
		@method = Testmethod.new(test_params)

		if @method.save
			redirect_to @method
		else
			render 'new'
		end
	end

	def destroy
		@method = Testmethod.find(params[:id])
		@method.destroy

		redirect_to testmethods_path
	end

	def update
		@method = Testmethod.find(params[:id])
 
		if @method.update(test_params)
			redirect_to @method
		else
			render 'edit'
		end
	end

	def index
		@testmethods = Testmethod.all()
	end

	def edit
		@method = Testmethod.find(params[:id])
	end

	def show
		@method = Testmethod.find(params[:id])
	end


private
  def test_params
    params.require(:testmethod).permit(:name, :description)
  end

end
