Feature: Oboarding a new User to Cryptowatch
  As a new User
  I want some helpful documentation
  So that I know how to connect my existing exchange accounts

  @smoke
  Scenario: View Documentation
    Given I generate new user data
      And I go to the Home page
    Then I should see the Top20CryptoAssets section
    When I click on the CreateAccountButton in the Header section
    Then I should now be on the CreateAccount page
    When I submit my email, username & password
    Then I should still be on the CreateAccount page
      And I should see the PhoneNumber textfield
    Then I click the SkipAddPhone button
    Then I should still be on the CreateAccount page
    When I click on the BasicAccount button
      And I click on the Finish button
    Then I should now be on the Home page
    # User is now logged in
    Then I should see the Top20CryptoAssets section
      And I should see the UsePortfolio button
    When I click on the Account button in the Header section
    Then I should now be on the Account page
    When I click on the Support item in the AccountMenu section
    Then i should now be on the Support page
      And I should see the text "How to write a bug report"
      And I should be able to see the bug reporting form with my username and email prepoulated
    When I click on the Documention item in the LeftNavigation section
    Then I should now be on the Docs page

  @smoke
  Scenario: Add Multi-factor Authentication
    Given I generate new user data
      And I go to the Home page
    Then I should see the Top20CryptoAssets section
    When I click on the CreateAccountButton in the Header section
    Then I should now be on the CreateAccount page
    When I submit my email, username & password
    Then I should still be on the CreateAccount page
      And I should see the PhoneNumber textfield
    Then I click the SkipAddPhone button
    Then I should still be on the CreateAccount page
    When I click on the BasicAccount button
      And I click on the Finish button
    Then I should now be on the Home page
    # User is now logged in
    Then I should see the Top20CryptoAssets section
      And I should see the UsePortfolio button
    When I click the UsePortfolio button in the HomeBanner section
    Then I should now be on the Portfolio page
      And I should see the text "View and manage your holdings across multiple exchanges. To get started, input API keys for your exchanges and Cryptowatch will automatically pull in balances as you trade, allowing you to view your overall portfolio value in real time."
      And I should see the ConnectExchangesHere button
    When I click the ConnectExchangesHere button
    Then I should now be on the AccountApiKeys page
    And I should see the text "Connect your accounts to make trades and calculate your portfolio in real time on Cryptowatch."
    When I click the ReadTheDocumentation link
    Then I should be in a new tab
      And I should now be on the ImportingApiKeys page
    And I should see the text "Here you’ll find instructions on how to connect your exchange accounts to Cryptowatch to enable automatic balance tracking in Portfolio and trading through our interface."
    When I close the tab
    Then I should be on the first tab
      And I should now be on the AccountApiKeys page
    When I click the SetUpMfa button  
    Then I should now be on the AccountSecurity page
    # use https://www.npmjs.com/package/node-2fa to generate a passcode to enter
    When I enter the MFA passcode into the MfaPasscode field
    And I click the Submit button
    Then I should see the text "Write these down somewhere safe. If you ever lose your mobile device, you will still be able to log in to your account using a recovery code"
    