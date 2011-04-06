Feature: Manage leads
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new lead
    Given I am signed in as an admin
      And the following contacts:
        |first_name|last_name|home_phone|cell_phone|work_phone|email|address_line_1|address_line_2|city|postal_code|state_id|
        |Minnie|Mouse|home_phone 1|cell_phone 1|work_phone 1|email 1|address_line_1 1|address_line_2 1|city 1|postal_code 1|1|
        |Jerry|Burns|home_phone 2|cell_phone 2|work_phone 2|email 2|address_line_1 2|address_line_2 2|city 2|postal_code 2|2|
        |Jack|Benny|home_phone 3|cell_phone 3|work_phone 3|email 3|address_line_1 3|address_line_2 3|city 3|postal_code 3|3|
        |Mickey|Mouse|home_phone 4|cell_phone 4|work_phone 4|email 4|address_line_1 4|address_line_2 4|city 4|postal_code 4|4|
    And I am on the new lead page
    When I fill in "Agent" with "11"
    And I select "Jerry Burns" from "Contact"
    And I fill in "Note" with "note 1"
    And I press "Create"
    Then I should see "11"
    And I should see "Jerry Burns"
    And I should see "note 1"

  Scenario: Delete lead
    Given I am signed in as an admin
      And the following contacts:
        |id|first_name|last_name|home_phone|cell_phone|work_phone|email|address_line_1|address_line_2|city|postal_code|state_id|
        |11|Minnie|Mouse|home_phone 1|cell_phone 1|work_phone 1|email 1|address_line_1 1|address_line_2 1|city 1|postal_code 1|1|
        |12|Jerry|Burns|home_phone 2|cell_phone 2|work_phone 2|email 2|address_line_1 2|address_line_2 2|city 2|postal_code 2|2|
        |13|Jack|Benny|home_phone 3|cell_phone 3|work_phone 3|email 3|address_line_1 3|address_line_2 3|city 3|postal_code 3|3|
        |14|Mickey|Mouse|home_phone 4|cell_phone 4|work_phone 4|email 4|address_line_1 4|address_line_2 4|city 4|postal_code 4|4|
      And the following users:
        |id|email|first_name|
        |1|email_1@example.com|Alpha|
        |2|email_2@example.com|Bravo|
        |3|email_3@example.com|Charlie|
        |4|email_4@example.com|Delta|
      And the following leads:
        |agent_id|contact_id|note|
        |1|11|note 1|
        |2|12|note 2|
        |3|13|note 3|
        |4|14|note 4|
    When I delete the 3rd lead
    Then I should see the following leads:
      |Agent|Contact|Note|
      |Alpha Jones|Minnie Mouse|note 1|
      |Bravo Jones|Jerry Burns|note 2|
      |Delta Jones|Mickey Mouse|note 4|
