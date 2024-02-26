*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/CommonKeywords.robot
Resource    ../resourses/MainPageKeywords.robot
Variables    ../variables/RegistrationPageVariables.py

*** Keywords ***
Make Registration
    [Arguments]    ${email}    ${password}    ${first_name}    ${last_name}    ${phone_number}
    input text    ${email_field}    ${email}
    input text    ${password_field}    ${password}
    input text    ${name_field}    ${first_name}
    input text    ${lastname_field}    ${last_name}
    input text    ${number_field}    ${phone_number}
    Custom Click    ${checkbox}
    Custom Click    ${create_account_hebe_button}
    wait until element is visible    ${registration_message}    timeout=10s

Field Validation
    [Arguments]    ${inputs_list}    ${field_locator_1}    ${field_locator_2}    ${error_message}    ${error_message_text}
    FOR    ${input}    IN    @{inputs_list}
        input text    ${field_locator_1}    ${input}
        click element    ${field_locator_2}
        element text should be    ${error_message}    ${error_message_text}
        Clear Element Text    ${field_locator1}
    END

Field Validation Сustom
    [Arguments]    ${inputs_list}    ${field_locator1}    ${field_locator2}    ${error_message}    ${error_message_text_list}
    FOR    ${input}    ${error_message_text}    IN ZIP    ${inputs_list}    ${error_message_text_list}
        input text    ${field_locator1}    ${input}
        click element    ${field_locator2}
        element text should be    ${error_message}    ${error_message_text}
        Clear Element Text    ${field_locator1}
    END