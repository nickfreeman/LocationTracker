require "spec_helper"

describe LocationsController do

	describe "basic functionality" do
		it 'should render index' do
			@test_locations = [Location.create!(), Location.create!()]
			get :index
			expect(response).to render_template("index")
			expect(assigns(:locations)).to match_array(@test_locations)
		end
	end

	describe "Storing and updating locations" do

		it "should call update and change values" do
			@location = Location.create!({:longitude => 5.0})
			put :update, {:id => @location.id, :latitude => 3.23, :longitude => 3432.3}
			@get_location = Location.find(@location.id)
			expect(@get_location.longitude).should == 3432.3
		end
	end

	describe "create location" do

		it 'should create a location to be found' do
			post :create, {:id => 4, :latitude => 5.9, :longitude => 23.9}
			@location = Location.find(4)
			expect(@location.latitude).should == 5.9
		end
	end
end