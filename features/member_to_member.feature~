Feature: Send another member an email to get his location and distance/time

 As a BAMRU field member who is preparing to leave on an operation
 So that I can determine how much time is left to pack and prepare.
 I want to send 

Background: field member's information has been added to database

 Given the following member info exist:
 | Name           | Email                    |
 | Shaumik Mondal | shaumik@berkeley.edu     |
 | Yina Jin       | yinajin@berkeley.edu     |
 | Nick Freeman   | nickfreeman@berkeley.edu |

 And I am a field member

Scenario: Clicking "Where Are You" button sends email to another specific member requesting the member's location
 
 When I press "Where Are You"
 Then I should see Successfully Sent 

Given empty database

Scenario: Clicking "Where Are You" button sends email to another specific member requesting the member's location
 
 When I press "Where Are You"
 Then I should see No members available

