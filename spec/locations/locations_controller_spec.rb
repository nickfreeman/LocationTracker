require "spec_helper"

describe LocationsController do
	describe "Searching for location" do
		before :each do
			fake_location = mock('Location')
			@fake_location.id = 3
		end
		it 'Should call the model method to look up locations' do
			@fake_location = mock('Location')
			@fake_location.id = 3
			Location.should_receive(:index).and_return([@fake_location])
			get :index, {:id => @fake_location.id}
		end
		it 'Should get the right location' do
			
		end
	end


	describe "Storing and updating locations" do
		it "should call update" do
			fake_location = mock('Location')
			@fake_location.id = 3
			Location.should_receive(:update)
			post :update, {:id => @fake_location.id, :latitude => 3.23, :longitude = 3432.3}
		end

		it "should successfully update" do
			post :update, {:id => @fake_location.id, :latitude => 3.23, :longitude = 3432.3}
			assign([:location.latitude, :location.longitude]).should == [3.23, 3432.3]
		end
	end
end