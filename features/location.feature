Feature: Enter location given from HTML geolocation

 As a BAMRU field member
 So that I can track my position
 I want to get my location sent when I press find me

Background: 


 Given I am a logged in as a member
 And I am on the "find my location" page


Scenario: Track my location
 
 When I press "Find My Location"
 Then my location should be registered