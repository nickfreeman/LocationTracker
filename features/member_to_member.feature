Feature: Send another member an email to get his location and distance/time

 As a BAMRU field member who is preparing to leave on an operation
 So that I can determine how much time is left to pack and prepare.
 I want to send an email to another member requesting their locatoin

Background: field member's information has been added to database

 Given the following users info exist:
 |name            |email                     |role   | password | password_confirmation |
 | Shaumik Mondal | themaster_759@hotmail.com| field | password | password 		|
 | Yina Jin       | solaris.jin@gmail.com    | field | password | password 		|
 | Nick Freeman   | nickfreeman@berkeley.edu | AHC   | password | password 		|
 | Yeung John Li  | liyeungjohn@yahoo.ca     | field | password | password 		|
 | James	  | james@berkeley.edu 	     | AHC   | password | password 		|


Scenario: Clicking "Send Request" button and selecting "members_all" sends emails to all members
 Given I am on the members page
 When I check "members_all"
 And I press "Send Request"
 Then I should be on the success page for "all"
 And I should see "Successfully Sent"
 And I should see all members 

Scenario: Clicking "Send Request" button and selecting specific members sends emails to selected members
 Given I am on the members page
 When I check "members_Yeung_John_Li"
 And I press "Send Request"
 Then I should be on the success page for "Yeung John Li"
 And I should see "Successfully Sent"
 And I should see "Yeung John Li"

Scenario: Not selecting any members should report error message
 Given I am on the members page
 When I press "Send Request"
 Then I should be on the members page
 And I should see "No members available"
