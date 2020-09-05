*** Variables ***


*** Settings ***
Resource  ../Sources/Objects/LoginPageObject.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
User should be able to login

    Given User is in loginpage
    And user sees title as Hello, who’s this?
    And user sees “email input” area
    And user sees email input’s placeholder as bruce@wayne.com
    And user sees “password input” area
    And user sees email password’s placeholder as At least 8 characters
    And user enters their’s correct email
    And user enters their’s correct password
    When user clicks on “Log in to Typeform” button
    Then User should be able to see CAPTCHA      #I encountered captcha for automation so this step is different than word. Please click on test"

