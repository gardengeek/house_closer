Feature: Manage contacts
  In order to manage my contacts
  A manager
  wants to manipulate his contacts
  
  Scenario: Register new contact, then modify contact
    Given I am signed in as an manager
    And I am on the new contact page
    When I fill in "First name" with "first_name 1"
      And I fill in "Last name" with "last_name 1"
      And I fill in "Home phone" with "home_phone 1"
      And I fill in "Cell phone" with "cell_phone 1"
      And I fill in "Work phone" with "work_phone 1"
      And I fill in "Email" with "email 1"
      And I fill in "Address line 1" with "address_line_1 1"
      And I fill in "Address line 2" with "address_line_2 1"
      And I fill in "City" with "city 1"
      And I fill in "Postal code" with "postal_code 1"
      And I select "Indiana" from "State"
      And I press "Create"
    Then I should see "first_name 1"
      And I should see "last_name 1"
      And I should see "home_phone 1"
      And I should see "cell_phone 1"
      And I should see "work_phone 1"
      And I should see "email 1"
      And I should see "address_line_1 1"
      And I should see "address_line_2 1"
      And I should see "city 1"
      And I should see "postal_code 1"
      And I should see "IN"
    When I follow "Edit"
      And I fill in "First name" with "Janet"
      And I press "Update"
    Then I should see "Janet"
      And I should see "successfully updated"

  Scenario: Register new contact with missing fields
    Given I am signed in as an manager
    And I am on the new contact page
    When I fill in "Address line 1" with "address_line_1 1"
      And I fill in "Address line 2" with "address_line_2 1"
      And I fill in "City" with "city 1"
      And I fill in "Postal code" with "postal_code 1"
      And I select "Indiana" from "State"
      And I press "Create"
    Then I should see "prohibited this contact from being saved"
    When I fill in "First name" with "Mickey"
      And I fill in "Last name" with "Mouse"
      And I press "Create"
    Then I should see "prohibited this contact from being saved"
      And I fill in "Home phone" with "home_phone 1"
      And I press "Create"
    Then I should see "Mickey Mouse"
      And I should see "home_phone 1"
      And I should see "address_line_1 1"
      And I should see "address_line_2 1"
      And I should see "city 1"
      And I should see "postal_code 1"
      And I should see "IN"
      And I should see "successfully created"
    When I follow "Edit"
      And I fill in "Home phone" with ""
      And I press "Update"
    Then I should see "prohibited this contact from being saved"
      And I fill in "Cell phone" with "5555551212"
      And I press "Update"
    Then I should see "5555551212"
      And I should see "successfully updated"
    When I follow "Edit"
      And I fill in "Cell phone" with ""
      And I press "Update"
    Then I should see "prohibited this contact from being saved"
      And I fill in "Work phone" with "5555551212"
      And I press "Update"
    Then I should see "5555551212"
      And I should see "successfully updated"
    When I follow "Edit"
      And I fill in "Work phone" with ""
      And I press "Update"
    Then I should see "prohibited this contact from being saved"
      And I fill in "Email" with "mouse@example.com"
      And I press "Update"
    Then I should see "mouse@example.com"
      And I should see "successfully updated"

  @allow-rescue
  Scenario: Not a manager
    Given I am signed in as "insider@example.com/asecret"
    And I am on the new contact page
    Then I should see "You are not authorized to access this page"

  Scenario: Not signed in
    Given I am on the new contact page
    Then I should see "You must be signed in to access this page"
    And I should see "Sign in"

  Scenario: Delete contact
    Given I am signed in as an manager
    And the following contacts:
      |first_name|last_name|home_phone|cell_phone|work_phone|email|address_line_1|address_line_2|city|postal_code|state_id|
      |first_name 1|last_name 1|home_phone 1|cell_phone 1|work_phone 1|email 1|address_line_1 1|address_line_2 1|city 1|postal_code 1|1|
      |first_name 2|last_name 2|home_phone 2|cell_phone 2|work_phone 2|email 2|address_line_1 2|address_line_2 2|city 2|postal_code 2|2|
      |first_name 3|last_name 3|home_phone 3|cell_phone 3|work_phone 3|email 3|address_line_1 3|address_line_2 3|city 3|postal_code 3|3|
      |first_name 4|last_name 4|home_phone 4|cell_phone 4|work_phone 4|email 4|address_line_1 4|address_line_2 4|city 4|postal_code 4|4|
    When I delete the 3rd contact
    Then I should see the following contacts:
      |Name|Home phone|Cell phone|Work phone|Email|
      |first_name 1 last_name 1|home_phone 1|cell_phone 1|work_phone 1|email 1|
      |first_name 2 last_name 2|home_phone 2|cell_phone 2|work_phone 2|email 2|
      |first_name 4 last_name 4|home_phone 4|cell_phone 4|work_phone 4|email 4|
