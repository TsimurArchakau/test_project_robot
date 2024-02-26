*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/CommonKeywords.robot
Resource    ../resourses/MainPageKeywords.robot
Variables    ../variables/LoginPageVariables.py

*** Keywords ***
Login
    [Arguments]    ${email}    ${password}
    input text    ${login_field}    ${email}
    input text    ${password_field}    ${password}
    click element    ${submit_button}
    wait for condition    return jQuery.active == 0