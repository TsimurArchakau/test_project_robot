*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HelpFunctionsLibrary.py
Resource    ../resourses/MainPageKeywords.robot
Resource    ../resourses/RegistrationPageKeywords.robot
Variables    ../variables/RegistrationPageVariables.py
Documentation    This test suite contains tests for the Registration page functionality.
Default Tags    Smoke
Suite Setup    Open Main Page,Accept Cookies,Close Promo Window and Go to Registration Page
Suite Teardown    Close Browser

*** Test Cases ***
Email Field Validation
    [Documentation]    This test case verifies the validation of the email field.
    Field Validation
    ...    ${invalid_emails_list}
    ...    ${email_field}
    ...    ${password_field}
    ...    ${email_error_message}
    ...    ${email_message_text}

Password Field Validation
    [Documentation]    This test case verifies the validation of the password field.
    Field Validation Сustom
    ...    ${invalid_passwords_list}
    ...    ${password_field}
    ...    ${email_field}
    ...    ${password_error_message}
    ...    ${password_message_text_list}

Name Field Validation
    [Documentation]    This test case verifies the validation of the name field.
    Field Validation
    ...    ${invalid_names_list}
    ...    ${name_field}
    ...    ${email_field}
    ...    ${name_error_message}
    ...    ${name_message_text}

Lastname Field Validation
    [Documentation]    This test case verifies the validation of the lastname field.
    Field Validation
    ...    ${invalid_lastnames_list}
    ...    ${lastname_field}
    ...    ${email_field}
    ...    ${lastname_error_message}
    ...    ${lastname_message_text}

Number Field Validation
    [Documentation]    This test case verifies the validation of the number field.
    Field Validation
    ...    ${invalid_numbers_list}
    ...    ${number_field}
    ...    ${email_field}
    ...    ${number_error_message}
    ...    ${number_message_text}

Valid Registration
    [Documentation]    This test case verifies the registration process with valid data.
    ${email}    ${password}    ${first_name}    ${last_name}    ${phone_number}=    generate random data
    Make Registration
    ...    ${email}
    ...    ${password}
    ...    ${first_name}
    ...    ${last_name}
    ...    ${phone_number}
    element should contain    ${registration_message}    Udało Ci się założyć konto!
    save credentials    ${email}    ${password}