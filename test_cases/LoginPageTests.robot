*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HelpFunctionsLibrary.py
Resource    ../resourses/MainPageKeywords.robot
Resource    ../resourses/LoginPageKeywords.robot
Variables    ../variables/LoginPageVariables.py
Documentation    This test suite contains tests for the Login page functionality.
Default Tags    Smoke
Suite Setup    Open Main Page,Accept Cookies and Close Promo Window
Suite Teardown    Close Browser
Test Setup    Go to Login Page

*** Test Cases ***
Valid Login
    [Documentation]    This test case verifies the login process with valid credentials.
    ${email}    ${password}=    load credentials
    Login    ${email}    ${password}
    element text should be    ${content_title}    Zamówienia
    Logout from account

Invalid Login
    [Documentation]    This test case verifies the login process with invalid credentials.
    FOR    ${login}    ${password}    IN ZIP    ${login_list}    ${password_list}
        Login    ${login}    ${password}
        element text should be    ${error_message}    ${error_message_text}
    END
    click element    ${close_button}

Logout
    [Documentation]    This test case verifies the logout process.
    ${email}    ${password}=    load credentials
    Login    ${email}    ${password}
    Logout from account
    location should be    https://www.hebe.pl/home