Feature: Enter location given from HTML geolocation

 As a BAMRU field member
 So that I can track my position
 I want to get my location sent when I press find me

Background: 


 Given I am logged in as a member
 And I am on the find my location page


Scenario: Track my location
 
 When I press "find_my_location"
 Then I should be asked the share my location



 Scenario: Look up a location

 Given my location is in the database
 And I am on the "locations" page 
 Then I should see my location