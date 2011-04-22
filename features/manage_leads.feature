Feature: Manage leads
  In order to capture leads
  A user
  wants to add leads
  
  Scenario: Register new lead with existing contact
    Given I am signed in as an admin
      And the following contacts:
        |first_name|last_name|home_phone|cell_phone|work_phone|email|address_line_1|address_line_2|city|postal_code|state_id|
        |Minnie|Mouse|home_phone 1|cell_phone 1|work_phone 1|email 1|address_line_1 1|address_line_2 1|city 1|postal_code 1|1|
        |Jerry|Burns|home_phone 2|cell_phone 2|work_phone 2|email 2|address_line_1 2|address_line_2 2|city 2|postal_code 2|2|
        |Jack|Benny|home_phone 3|cell_phone 3|work_phone 3|email 3|address_line_1 3|address_line_2 3|city 3|postal_code 3|3|
        |Mickey|Mouse|home_phone 4|cell_phone 4|work_phone 4|email 4|address_line_1 4|address_line_2 4|city 4|postal_code 4|4|
      And the following agents:
        |email|first_name|last_name|
        |email_1@example.com|Alpha|One|
        |email_2@example.com|Bravo|Two|
        |email_3@example.com|Charlie|Three|
        |email_4@example.com|Delta|Four|
      And I am on the new lead page
    When I select "Jerry Burns" from "Contact"
      And I fill in "Note" with "note 1"
      And I press "Create"
    Then I should see "successfully created"
      And I should see "Alpha One"
      And I should see "Jerry Burns"
      And I should see "note 1"

  Scenario: Register new lead with new contact
    Given I am signed in as an admin
      And the following agents:
        |email|first_name|last_name|
        |email_1@example.com|Alpha|One|
        |email_2@example.com|Bravo|Two|
        |email_3@example.com|Charlie|Three|
        |email_4@example.com|Delta|Four|
      And I am on the new lead page
    When I fill in "First name" with "Micky"
      And I fill in "Last name" with "Mouse"
      And I fill in "Home phone" with "555.555.1212"
      And I fill in "Cell phone" with "317.555.1212"
      And I fill in "Work phone" with "work_phone 1"
      And I fill in "Email" with "email 1"
      And I fill in "Address line 1" with "address_line_1 1"
      And I fill in "Address line 2" with "address_line_2 1"
      And I fill in "City" with "city 1"
      And I fill in "Postal code" with "postal_code 1"
      And I select "Indiana" from "State"
      And I fill in "Note" with "note 1"
      And I press "Create"
    Then I should see "successfully created"
      And I should see "Micky Mouse"
      And I should see "555.555.1212"
      And I should see "317.555.1212"
      And I should see "work_phone 1"
      And I should see "email 1"
      And I should see "address_line_1 1"
      And I should see "address_line_2 1"
      And I should see "city 1"
      And I should see "postal_code 1"
      And I should see "IN"
      And I should see "note 1"
    When I follow "Edit"
      And I fill in "Note" with "Note 2"
      And I press "Update"
    Then I should see "Note 2"
      And I should see "successfully updated"

  Scenario: Create lead with no data
    Given I am signed in as an admin
      And the following agents:
        |email|first_name|last_name|
        |email_1@example.com|Alpha|One|
        |email_2@example.com|Bravo|Two|
        |email_3@example.com|Charlie|Three|
        |email_4@example.com|Delta|Four|
      And I am on the new lead page
      And I press "Create"
    Then I should see "3 errors prohibited this contact from being saved"
      And I should see "1 error prohibited this lead from being saved"
    When I fill in "First name" with "Micky"
      And I fill in "Last name" with "Mouse"
      And I fill in "Home phone" with "555.555.1212"
      And I press "Create"
    Then I should see "successfully created"
      And I should see "Micky Mouse"
      And I should see "555.555.1212"
      
  Scenario: Delete lead
    Given the following contacts:
        |id|first_name|last_name|home_phone|
        |11|Minnie|Mouse|home_phone 1|
        |12|Jerry|Burns|home_phone 2|
        |13|Jack|Benny|home_phone 3|
        |14|Mickey|Mouse|home_phone 4|
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
      And I am signed in as an admin
    When I delete the 3rd lead
    Then I should see the following leads:
      |Agent|Contact|Active|
      |Alpha Jones|Minnie Mouse|true|
      |Bravo Jones|Jerry Burns|true|
      |Delta Jones|Mickey Mouse|true|
