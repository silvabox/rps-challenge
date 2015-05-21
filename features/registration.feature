Feature: Registration
  As a marketeer
  So that I can see my name in lights
  I would like to register my name before playing an online game


  Scenario:  User can register
    Given I am on the home page
    Then I should see "Please enter your name"


  Scenario:  User registers and sees their name
    Given I am on the home page
    When I enter "Ben" in "name"
    And click "Submit"
    Then I should see "Hello Ben!"