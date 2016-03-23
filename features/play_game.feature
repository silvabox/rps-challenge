Feature: playing the game
  As a marketeer
  So that I can enjoy myself away from the daily grind
  I would like to be able to play rock/paper/scissors


  Scenario: User can win the game
    Given I am registered as "Ben"
    And the computer will choose "Scissors"
    When I choose "Rock"
    Then I should see "You chose Rock, which beats Scissors"
    And I should win the game


  Scenario: User can draw the game
    Given I am registered as "Ben"
    And the computer will choose "Paper"
    When I choose "Paper"
    Then I should see "Computer chose Paper too!"
    And I should draw the game


  Scenario: User can lose the game
    Given I am registered as "Ben"
    And the computer will choose "Rock"
    When I choose "Scissors"
    Then I should see "Computer chose Rock, which beats Scissors"
    And I should lose the game
