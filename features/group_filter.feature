Feature: Filter locations by a single tagged group

Given the following locations exist
	|latitude|longitude|name          |
	|38      |-120     |Jeffery Dahmer|
	|35      |-115     |Jeffery Dahmer|
	|42      |-100     |Jeffery Dahmer|
	|40      |-110     |Ted Bundy     |
	|37      |-121     |Dennis Nilsen |

Given I have created users
	

Scenario: Pick a single group
Given I am logged in and on the map page
When I fill in "search_name" with "group 1"
And I press "search_submit"
Then I should only see locations with group "group 1"


Scenario: See all locations
Given I am logged in and on the map page
When I fill in "search_name" with ""
And I press "search_submit"
Then I should see all of the locations

