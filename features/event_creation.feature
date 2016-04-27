Feature: Event Create

  Scenario: Existing User Can Create Event

    Given I already have an account and a room
    When I go to the sign in path
    And I fill in "Email" with "test_user@spacebook.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    When I go to the root path
    And I fill in "Name" with "The Iron Yard Graduation Ceremony"
    And I select "2018" from "event_start_time_1i"
    And I fill in "Description" with "Party time!"
    And I fill in "Agenda" with "YA DONE BOY!"
    And I press "Submit"
    Then I should see "Show Event"
