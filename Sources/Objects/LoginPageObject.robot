*** Settings ***
Library  SeleniumLibrary
Library    Collections
Library    RequestsLibrary
Library    String
Library    Dialogs

Resource   ../Variables/LoginVariables.robot
*** Variables ***
${BASE_URL}    test
*** Keywords ***
Begin Web Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

User is in loginpage
    wait until element is visible    ${LoginTypeButton}    timeout=5
    ${loginbtntext} =    get text    ${LoginTypeButtonTxt}
    should be equal  ${loginbtntext}   Log in to Typeform

user sees title as Hello, who’s this?
    wait until element is visible    ${LoginTitle}    timeout=5
    ${titletext} =    get text    ${LoginTitle}
    should be equal    ${titletext}   Hello, who’s this?

user sees “email input” area
    wait until element is visible    ${emailinputfield}

user sees email input’s placeholder as bruce@wayne.com
    ${emailplaceholder}=	Get Element Attribute	${emailinputfield}	placeholder
    should be equal  ${emailplaceholder}    bruce@wayne.com

user sees “password input” area
    wait until element is visible    ${PasswordInputfield}

user sees email password’s placeholder as At least 8 characters
    ${passswordplaceholder}=	Get Element Attribute	${PasswordInputfield} 	placeholder
    should be equal   ${passswordplaceholder}  At least 8 characters

user enters their’s correct email
    input text    ${emailinputfield}    ${mail}


user enters their’s correct password
    input text   ${PasswordInputfield}  ${password}

user clicks on “Log in to Typeform” button
    click element    ${LoginTypeButton}


User should be able to see CAPTCHA
    Log                         Waiting for CAPTCHA
    Execute Manual Step    Please complete the CAPTCHA portion of the form.



