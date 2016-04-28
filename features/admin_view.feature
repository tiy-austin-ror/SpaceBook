Feature: Admin dashboard view

    Scenario: Login as administrator
        Given I have an existing admin account
        When I go to the sign in path
        And I fill in "Email" with "test_admin@spacebook.com"
        And I fill in "Password" with "password"
        When I press "Sign in"
        Then I should see "Send an invite to join your company:"
