Feature: Send another member an email to get his location and distance/time

 As a BAMRU field member who is preparing to leave on an operation
 So that I can determine how much time is left to pack and prepare.
 I want to send an email to another member requesting their locatoin

Background: field member's information has been added to database

 Given the following users info exist:
 |name            |email                     |role   |
 | Shaumik Mondal | shaumik@berkeley.edu     | field |
 | Yina Jin       | yinajin@berkeley.edu     | field |
 | Nick Freeman   | nickfreeman@berkeley.edu | AHC   |
 | Yeung John Li  | liyeungjohn@yahoo.ca     | field |
 | James	  | james@berkeley.edu 	     | AHC   |


Scenario: Clicking "Send Request" button sends emails to selected members requesting the member's location
 
 When I press "Send Request"
 Then I should see "Successfully Sent" 



Scenario: No members on the field

Given empty database
 
 Then I should see "No members available"

