Feature: Seeing only a single users locations

Background:

Given the following locations exist
	|latitude|longitude|name          |
	|38      |-120     |Jeffery Dahmer|
	|35      |-115     |Jeffery Dahmer|
	|42      |-100     |Jeffery Dahmer|
	|40      |-110     |Ted Bundy     |
	|37      |-121     |Dennis Nilsen |

	

Scenario: Selecting only one name
	Given I am logged in and on the map page
	When I fill in "search_name" with "Jeffery Dahmer"
	And I press "search_submit"
	Then I should only see locations with "Jeffery Dahmer"
