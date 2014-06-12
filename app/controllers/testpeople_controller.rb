class TestpeopleController < ApplicationController

	def create
		@testperson = Testperson.create(testperson_params)
		if @testperson.save
			 respond_to do |format|
			  format.json { render json: @testperson }
			 end
		end
	end

	private
	  def testperson_params
	    params.require(:testperson_params).permit(:browser, :ip, :start_date, :end_date, :usertest_id, :width, :height, :id)
	  end
end
