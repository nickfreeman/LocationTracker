Feature: Login to the WebApp

Background: members have been added to database

	Given the following users info exist:
	 | name  	| email                    | password   	| password_confirmation |
	 | Shaumik 	| shaumik@berkeley.edu     | password 		| password		|
	 | Yina       	| yinajin@berkeley.edu     | 12345678		| 12345678		|
	 | Nick   	| nickfreeman@berkeley.edu | test_password 	| test_password		|
	
	And I am on the home page

Scenario: Login with a correct username/password
	When I fill in "Username" with "Shaumik"
	And I fill in "Username" with "Shaumik"
	When I press "Login"
	Then I should be logged in

Scenario: Login with incorrect username/password
	When I enter yinajing@berkeley.edu into "Username"
	When I enter password into "Password"
	When I press "Login"
	Then I should see "Username/Email and password do not match"
	And I should not be logged in
