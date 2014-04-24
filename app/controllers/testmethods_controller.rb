class TestmethodsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_method, only: [:show, :edit, :update, :destroy]

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
		@method.destroy
		redirect_to testmethods_path
	end

	def update
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
		
	end

	def show
		
	end


private

  def set_method
    @method = Testmethod.find(params[:id])
  end

  def test_params
    params.require(:testmethod).permit(:name, :description)
  end

end
