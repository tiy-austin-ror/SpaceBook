Feature: Accept Invites

  Scenario: Users can accept an invite

    Given I have a logged in user
    When I go to the user dashboard
    And I fill in "Email" with "test_admin@spacebook.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    When I visit my campus
    And I click "Create New Room"
    And I fill in "Name" with "Brent's campus for kids who can't read good"
    And I fill in "Location" with "2nd floor, in the bathroom"
    And I fill in "Capacity" with "17"
    And I press "Create Room"
    Then I should see "Viewing a room"


  Scenario: Regular users cannot create a room
