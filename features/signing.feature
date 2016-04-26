Feature: Signing In/Out

    Scenario: An Admin Signs In
      Given I have an existing admin account
      When I go to the sign in path
      And I fill in "Email" with "test_admin@spacebook.com"
      And I fill in "Password" with "password"
      And I press "Sign in"
      Then I should see "Welcome: Admin User"

    Scenario: A User Signs In
      Given I have an existing account
      When I go to the sign in path
      And I fill in "Email" with "test_user@spacebook.com"
      And I fill in "Password" with "password"
      And I press "Sign in"
      Then I should see "Welcome: Test User"


      Scenario: An Admin Signs Out
        Given I have an existing admin account
        When I go to the sign in path
        And I fill in "Email" with "test_admin@spacebook.com"
        And I fill in "Password" with "password"
        And I press "Sign in"
        When I go to the root path
        And I click "Sign out"
        Then I should see "Forgot password?"

      Scenario: A User Signs Out
        Given I have an existing account
        When I go to the sign in path
        And I fill in "Email" with "test_user@spacebook.com"
        And I fill in "Password" with "password"
        And I press "Sign in"
        When I go to the root path
        And I click "Sign out"
        Then I should see "Forgot password?"
