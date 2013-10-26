Feature: Send another member an email to get his location and distance/time

 As a BAMRU field member who is preparing to leave on an operation
 So that I can determine how much time is left to pack and prepare.
 I want to send an email to another member requesting their locatoin

Background: field member's information has been added to database

 Given the following member info exist:
 |name            |email                     |role   |
 | Shaumik Mondal | shaumik@berkeley.edu     | god   |
 | Yina Jin       | yinajin@berkeley.edu     | field |
 | Nick Freeman   | nickfreeman@berkeley.edu | AHC   |
 | Yeung John Li  | liyeungjohn@berkeley.edu | field |
 | James	  | james@berkeley.edu 	     | AHC   |

 And I am a logged in member

Scenario: Clicking "Where Are You" button sends email to another specific member requesting the member's location
 
 When I press "Where Are You"
 Then I should see Successfully Sent 

Given empty database

Scenario: Clicking "Where Are You" button sends email to another specific member requesting the member's location
 
 When I press "Where Are You"
 Then I should see No members available

