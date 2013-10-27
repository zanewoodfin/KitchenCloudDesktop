Feature: Login
  In order to access my account
  As a valid user
  I want to be able to login

  Background:
    Given the following user records
      |username|email          |password|password_confirmation|first_name|last_name|
      |user_z  |email@email.com|password|password             |zane      |woodfin  |

  Scenario: Logging in with valid credentials
    Given I am on the home page
    When I click "Sign-In"
    And I fill in "Username" with "user_z"
    And I fill in "Password" with "password"
    And I press "SIGN IN"
    Then I should see "Sign-Out"

  Scenario: Logging out
    Given I am on the home page
    And I click "Sign-In"
    And I fill in "Username" with "user_z"
    And I fill in "Password" with "password"
    And I press "SIGN IN"
    And I click "Sign-Out"
    Then I should see "Sign-In"

