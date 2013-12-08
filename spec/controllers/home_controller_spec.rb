require "spec_helper"
require 'timecop'
include Warden::Test::Helpers
Warden.test_mode!

describe HomeController do

	before :each do
		@user1 = FactoryGirl.create(:user)
	end
	
	describe "the map", js: true do
		it "should render all locations" do
			sign_in @user1
			@test_locations = [Location.create!(), Location.create!(), Location.create!()]
			get :show
			expect(response).to render_template("show")
			expect(assigns(:geolocations)).to match_array(@test_locations)
		end

		it "should filter by time" do
			sign_in @user1
			time = Time.now
			l1 = Location.create!()
			Timecop.travel(Time.now + 60.minutes) do
				@l2 = Location.create!()
				@l3 = Location.create!()
			end
			Timecop.travel(Time.now + 70.minutes) do
				get :show, :search_time => '20'
				expect(assigns(:geolocations)).to match_array([@l2, @l3])
			end
		end

		it "should filter by name" do
			sign_in @user1
			@l1 = Location.create!(:name => "Tom Brady")
			@l2 = Location.create!(:name => "Tom Brady")
			@l3 = Location.create!(:name => "Manning")
			get :show, :search_name => 'Tom Brady'
			expect(assigns(:geolocations)).to match_array([@l1, @l2])
		end

		it 'should filter by name and time' do
			sign_in @user1
			@l1 = Location.create!(:name => "Tom Brady")
			Timecop.travel(Time.now + 60.minutes) do
				@l2 = Location.create!(:name => "Tom Brady")
				@l3 = Location.create!(:name => "Manning")
			end
			Timecop.travel(Time.now + 70.minutes) do
				get :show, :search_time => '20'
				get :show, :search_name => 'Tom Brady'
				expect(assigns(:geolocations)).to match_array([@l2])
			end
		end
	end
end
