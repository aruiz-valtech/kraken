Feature: Login to an existing Cryptowatch account
  As a User
  I want to be able to log into my account
  So that I can place trades and track my aggregate price of assets across exchanges

  @smoke
  Scenario Outline: Login with existing account
    Given I go to the Home page
    Then I should see the Top20CryptoAssets section
    When I click on the Login button in the Header section
    Then I should see the LoginHeader section
    When I type "carits1" into the LoginEmail field in the LoginHeader section
      And I type "password1" into the LoginPassword in the field LoginHeader section
      And I click on the Login button in the Loginheader section
    Then I should now be on the Home page
      And I should see the Top20CryptoAssets section
      And I should see the Account button with my username
      And I should see the LogOut button in the Header section
      And I should see the UpgradeToPremium button in the Header section
      And I should see the UsePortfolio button

  Scenario: Navigate to Login page via Create Account
    Given I go to the Home page
    When I click on the CreateAccount button in the Header section
    Then I should now be on the CreateAccount page
    When I click on the Login button
    Then I should now be on the Login page
    When I type "carits1" into the LoginEmail field
      And I type "password1" into the LoginPassword field
      And I click on the Login button
    Then I should see the Account page

  @negative
  Scenario: Navigate to Login page via Create Account
    Given I go to the Home page
    When I click on the CreateAccount button in the Header section
    Then I should now be on the CreateAccount page
    When I click on the Login button
    Then I should now be on the Login page
    When I type <username> into the LoginUsername field
      And I type <password> into the LoginPassword field
      And I click on the Login button
    Then I should see the login <errorType> <message>
      | username     | password  | errorType | loginMessage                                              |
      | carits.test@ | password1 | message   | Please log in with your username, not your email address. |
      | carits1      | pass      | message   | Username or password incorrect                            |
      |              | password1 | tooltip   | Please fill in this field                                 |
      | carits1      |           | tooltip   | Please fill in this field                                 |

  @negative
  Scenario Outline: Login with existing account :: Negative tests
    Given I go to the Home page
    When I click on the Login button in the Header section
      And I type <username> into the LoginUsername field
      And I type <password> into the LoginPassword field
      And I click on the Login button
    Then I should see the login <errorType> with the text <message>
      | username     | password  | errorType | loginMessage                                                |
      | carits.test@ | password1 | message   | "Please log in with your username, not your email address." |
      | carits1      | pass      | message   | "Username or password incorrect"                            |
      |              | password1 | tooltip   | "Please fill in this field"                                 |
      | carits1      |           | tooltip   | "Please fill in this field"                                 |

