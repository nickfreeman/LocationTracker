Feature: Login to the WebApp

Background: members have been added to database

	Given the following member info exist:
	 | Username   	| Email                    | Password   	|
	 | Shaumik 		| shaumik@berkeley.edu     | password 		|
	 | Yina       	| yinajin@berkeley.edu     | 12345678		|
	 | Nick   		| nickfreeman@berkeley.edu | test_password 	|
	
	And that I am on the login screen

Scenario: Login with a correct username/password
	When I enter shaumik@berkeley.edu into "Username"
	When I enter password into "Password"
	When I press "Login"
	Then I should be logged in

Scenario: Login with incorrect username/password
	When I enter yinajing@berkeley.edu into "Username"
	When I enter password into "Password"
	When I press "Login"
	Then I should see "Username/Email and password do not match"
	And I should not be logged in
