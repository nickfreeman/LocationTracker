require 'factory_girl'

FactoryGirl.define do

	factory :user do
		name 'test person'
		email 'user#{rand(1000)}@factory.com'
		password 'testtest'
		password_confirmation 'testtest'
		role 'Field'
	end
end
