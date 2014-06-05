class UsertestsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show]
	before_action :set_test, :set_methodname, :get_methodname, only: [:show, :edit, :update, :destroy, :test]

	def new
		@test = Usertest.new()
		@upload = @test.uploads.build
	end

	def create
		@test = Usertest.new(test_params)
		@test.status = 0
		@test.user = current_user
		
		if @test.save

			if params[:uploads]
				params[:uploads]['photo'].each do |a|
					@upload = @test.uploads.create!(:photo => a, :usertest_id => @test.id)
				end
			end

			redirect_to usertests_path
		else
			render 'new'
		end
	end

	def show
		@uploads = @test.uploads.all
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
		#@tests = Usertest.all()

		 @tests = Usertest.where(nil) # creates an anonymous scope
  		 @tests = @tests.finished() if params[:finished].present?

  		 @tests.inspect
	end


	def finished
		@tests = Usertest.finished()
	end

	def edit
	  if current_user != @test.user
	  	redirect_to @test, notice: 'Je kunt deze test niet bewerken.'
	  end
	end

	def share
		@test = Usertest.find(params[:id])
	end

private
  def set_test
    @test = Usertest.find(params[:id])
  end

  def test_params
    params.require(:usertest).permit(:title, :introtext, :outrotext, :methodname, :start_date, :end_date, :status, :product, :url, :glyphoption1, :glyphoption2, :glyphoption3, uploads_attributes: [:id, :usertest_id, :photo])
  end

  def set_methodname
		gon.push({
		  :methodname => @test.methodname
		})
  end

	def get_methodname 

		if @test.methodname === 1
			@methodname = "Memory test"

		elsif @test.methodname  === 2
			@methodname = "Blur test"

		elsif @test.methodname  === 3
			@methodname = "Zwart wit test"
			
		elsif @test.methodname  === 4
			@methodname = "AB test"

		elsif @test.methodname  === 5
			@methodname = "Onleesbaar test"
		else
			abort("Er is geen methode geselecteerd, check UsertestsController")
		end		
	end

end
