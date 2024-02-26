*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/CommonKeywords.robot
Resource    ../resourses/MainPageKeywords.robot
Documentation    This test suite contains tests for the Main page functionality.
Default Tags    Smoke
Suite Setup    Open Main Page,Accept Cookies and Close Promo Window
Suite Teardown    close browser

*** Test Cases ***
Search String
    [Documentation]    This test case verifies the correctness of the search string functionality.
    Find by search string    LASH
    @{search_results}=    Assert Element    ${search_results}    return_many=True
    FOR    ${result}    IN    @{search_results}
        ${result_text}=    Get Text    ${result}
        Should Contain    ${result_text}    LASH
    END

