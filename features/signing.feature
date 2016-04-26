Feature: Signing In/Out

    Scenario: An Admin Signs In
      Given I have an existing admin account
      When I go to the sign in path
      And I fill in "Email" with "test_admin@spacebook.com"
      And I fill in "Password" with "password"
      And I press "Sign in"
      Then I should see "click an event to edit it:"

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

      Scenario: Creating An Invited User
        Given I have an invitation
        When I go to the invitation sign up page
        And I fill in "Username" with "testcumber"
        And I fill in "Email" with "testcumber@spacebook.com"
        And I fill in "Name" with "Cucumber Tester"
        And I fill in "Phone num" with "5555555555"
        And I fill in "Password" with "password"
        And I fill in "Password confirmation" with "password"
        And I press "Create User"
        Then I should see "SpaceBook"

        Scenario: Creating An Uninvited User
          When I go to the sign up path
          And I fill in "Username" with "testcumber"
          And I fill in "Email" with "testcumber@spacebook.com"
          And I fill in "Name" with "Cucumber Tester"
          And I fill in "Phone num" with "5555555555"
          And I fill in "Password" with "password"
          And I fill in "Password confirmation" with "password"
          And I press "Create User"
          Then I should see "Invalid invite link. This is a very exclusive app, you must be invited first!!"
