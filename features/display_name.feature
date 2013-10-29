Feature: DisplayName
  As a valid user
  I want to be able to change my display name

  Background:
    Given the following user records
      |username|email          |password|password_confirmation|first_name|last_name|
      |user_z  |email@email.com|password|password             |Zane      |Woodfin  |

  Scenario: My display name should appear in the header
    Given I am on the home page
    When I click "Sign-In"
    And I fill in "Username" with "user_z"
    And I fill in "Password" with "password"
    And I press "SIGN IN"
    Then I should see "Welcome back Zane"

  @javascript
  Scenario: I should be able to change my display name
    Given I am on the home page
    When I click "Sign-In"
    And I fill in "Username" with "email@email.com"
    And I fill in "Password" with "password"
    And I press "SIGN IN"
    And I click "Zane"
    And I select "user_z" from "display_name_option"
    Then I should see "Welcome back user_z"

  @javascript
  Scenario: My display name should be maintained through logut/login
    Given I am on the home page
    When I click "Sign-In"
    And I fill in "Username" with "email@email.com"
    And I fill in "Password" with "password"
    And I press "SIGN IN"
    And I click "Zane"
    And I select "user_z" from "display_name_option"
    And I click "Sign-Out"
    And I click "Sign-In"
    And I fill in "Username" with "email@email.com"
    And I fill in "Password" with "password"
    And I press "SIGN IN"
    Then I should see "Welcome back user_z"
