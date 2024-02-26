*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open main page
    [Arguments]    ${url}   ${browser_name}
    open browser    ${url}    ${browser_name}
    maximize browser window

Assert Element
    [Arguments]    ${xpath}    ${clickable}=False    ${return_many}=False
    Wait Until Element Is Visible    ${xpath}    timeout=5s
    Run Keyword If    ${clickable}    Wait Until Element Is Enabled    ${xpath}
    ${result}=    Run Keyword If    ${return_many}    Get WebElements    ${xpath}    ELSE    Get WebElement    ${xpath}
    RETURN    ${result}

Hover over element
    [Arguments]    ${xpath}
    ${element}=    Get WebElement    ${xpath}
    mouse over  ${element}

Custom Click
    [Arguments]    ${selector}
    Execute JavaScript    document.querySelector("${selector}").click();

Extract Element CSS Property
    [Arguments]    ${locator}    ${property}
    ${element}=    Get WebElement    ${locator}
    ${element_property_value}=    Call Method       ${element}    value_of_css_property    ${property}
    RETURN    ${element_property_value}
