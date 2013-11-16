Feature: Login to the WebApp

Background: members have been added to database

	Given the following users info exist:
	 | name  	| email                    | password   	| password_confirmation |
	 | Shaumik 	| shaumik@berkeley.edu     | password 		| password		|
	 | Yina       	| yinajin@berkeley.edu     | 12345678		| 12345678		|
	 | Nick   	| nickfreeman@berkeley.edu | test_password 	| test_password		|
	
	And I am on the home page

Scenario: Login with a correct username/password
	When I fill in "Email" with "shaumik@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Sign in"
	Then I should be logged in

Scenario: Login with incorrect username/password
	When I fill in "Email" with "yinajin@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Sign in"
	Then I should see "Username/Email and password do not match"
