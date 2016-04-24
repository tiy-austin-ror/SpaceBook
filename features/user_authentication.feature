Feature: User Authentication

  Scenario: Existing User Can Visit Login Page

    Given I have an existing account
    When I go to the sign in path
    Then I should see "Sign in"

  Scenario: Existing Users Can SignIn

    Given I have an existing account
    When I go to the sign in path
    And I fill in "Email" with "test_user@spacebook.com"
    And I fill in "Password" with "password"
    And I click "Sign in"
    Then I should see "Sign out"
