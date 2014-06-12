class ResultsController < ApplicationController

	def new
		@result = Result.new()
	end

	def create
		
		@test = Usertest.find(session[:usertest_id])
	    @result = Result.create :testperson_id => params[:result][:testperson_id], :usertest_id => session[:usertest_id], :result => {"q1" => params[:result][:q1], "q2" => params[:result][:q2]}

	    if @result.save
	    	render "thankspage"
	    end
	end

	private
		def result_params
    		params.require(:result).permit(:q1, :q2, :testperson_id)
  		end
end