Feature: Enter location given from HTML geolocation

 As a BAMRU field member
 So that I can track my position
 I want to get my location sent when I press find me

Background: 


 Given I am logged in as a member
 And I am on the find my location page


	 Scenario: Look up a location

		 Given my location is in the database
		 And I am on the find my location page
		 Then I should see my location