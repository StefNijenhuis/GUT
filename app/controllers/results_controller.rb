class ResultsController < ApplicationController
	 before_action :authenticate_user!
	 

	def new
		@result = Result.new()
	end

	def create
    abort("Derp")
    @usertest = Usertest.find(params[:usertestid])
    Result.create!( :testpersonid => current_testuser.id, :usertest_id => params[:id], :result => "hai")
    redirect_to @usertest 
	end
end
