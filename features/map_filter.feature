Feature: Sorting the Location's Table by Name, or position closest to the headquarter
	Given the following locations exist:
	
	|created_at|updated_at|latitude|longitude|name          |
	|		   |          |38      |-120     |Jeffery Dahmer|
	|          |          |40      |-110     |Ted Bundy     |
	|          |          |37      |-121     |Dennis Nilsen |
	
	And I am on the location 

Scenerio: Sorting by name
When I press "Sorty by Name"
Then I should see "Ted Bundy" before "Jeffery Dahmer"

Scenerio: Sorting by distance
When I press "Sort by Distance"
Then I should see "Dennis Nilsen" before "Ted Bundy"
