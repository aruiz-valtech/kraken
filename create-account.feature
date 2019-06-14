Feature: Create New Cryptowatch Account
  As a user
  I want to be able to create an account
  So that I can use the Cryptowatch Exchange

  @smoke
  Scenario Outline: Create Basic Account with/without phone number
    Given I generate new user data
      And I go to the Home page
    Then I should see the Top20CryptoAssets section
      And I should see the Login button in the Header section
      And I should see the CreateAccount button in the Header section
      And I should see the GetStarted button in the
    When I click on the <createAccountButton>
    Then I should now be on the CreateAccount page
    When I submit my email, username & password
    Then I should still be on the CreateAccount page
      And I should see the PhoneNumber textfield
    Then <shouldAddPhoneNumber>
    Then I should still be on the CreateAccount page
    When I click on the BasicAccount button
      And I click on the Finish button
    Then I should now be on the Home page
    # User is now logged in
    Then I should see the Top20CryptoAssets section
      And I should see the Account button with my username
      And I should see the LogOut button in the Header section
      And I should see the UpgradeToPremium button in the Header section
      And I should see the UsePortfolio button in the HomeBanner section
    When I open the email inbox for the new user
    Then I should see an unread email with the subject "Cryptowatch: New Account"
    When I open the unread email with the subject "Cryptowatch: New Account"
    Then I should see in the email body text "Welcome to Cryptowatch"
    Examples:
      | createAccountButton                              | shouldAddPhoneNumber            |
      | CreateAccountButton in the Header section        | I click the SkipAddPhone button |
      | GetStarted button in the HomeBanner section      | I add my phone number           |

 @smoke
 Scenario Outline: Assert user is able to navigate to create account page
    Given I generate new user data
      And I go to the Home page
    Then I should see the Top20CryptoAssets section
      And I should see the Login button in the Header section
      And I should see the CreateAccount button in the Header section
      And I should see the GetStarted button in the
    When I click on the <createAccountButton>
    Then I should now be on the CreateAccount page
    Examples:
      | createAccountButton                              | 
      | StartTrading button in the Main section          | 
      | CreateAccount button in the LowerHome section    | 
      # BUG: /account/create page still says "Sign up for a free account"
      | SignUpForPremium button in the LowerHome section | 
      
