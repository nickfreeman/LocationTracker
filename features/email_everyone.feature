Feature: Email every field member on the duty roster to request their location

 As an At Home Coordinator (AHC)
 So that I can reach every field member
 I want to send email to every field member on the duty roster requesting their location with a “Request Location” button

Background: field member's information has been added to database

 Given the following member info exist:
 | Name           | Email                    |
 | Shaumik Mondal | shaumik@berkeley.edu     |
 | Yina Jin       | yinajin@berkeley.edu     |
 | Nick Freeman   | nickfreeman@berkeley.edu |

 And I am AHC

Scenario: Clicking Request Location button sends email to active duty member requesting location
 
 When I press "Request Location"
 Then I should see "Success"
 And I should see list of all the members that received the email


Given empty database

Scenario: Request Location should say no member active
 When I press "Request Location"
 Then I should see "No active member in field"