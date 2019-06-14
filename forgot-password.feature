Feature: Retreive Forgotten Password
  As I User
  I want to retrieve a forgotten Password
  So that I can log into cryptowatch

  @smoke
  Scenario:
    Given I go to the Home page
    When I click on the Login button in the Header section
    Then I should see the LoginHeader section
    When I click on the ForgotPassword button in the LoginHeader section
    Then I should now be on the RecoverPassword page
    When I type "carits1" into the Username field
    And I click on the SendMeInstructions button    
    Then I should see a message with the text "An email has been sent with instructions for resetting your password."
      And I should see a message with the text "For security reasons this request is only valid for 20 minutes."
    When I open the email inbox for "carits.test@gmail.com"
    Then I should see an unread email with the subject "Password reset instructions"
    When I open the unread email with the subject "Password reset instructions"
    Then I should see in the email body text "A password reset request has been submitted for your Cryptowatch account by"
      And I should see in the email body text "To reset your password, visit:"
      And i should see in the email boxy text "This link will expire in 20 minutes. If you did not ask to reset your password you can ignore this request."

  @negative
  Scenario:
    Given I go to the Home page
    When I click on the Login button in the Header section
    Then I should see the LoginHeader section
    When I click on the ForgotPassword button in the LoginHeader section
    Then I should now be on the RecoverPassword page
    When I click on the SendMeInstructions button
    Then I should see a tooltip with the text "Please fill in this field"
    When I type "fake-email" into the Username field
    And I click on the SendMeInstructions button    
    Then I should see a message with the text "No user found for that username"
