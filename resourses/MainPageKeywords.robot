*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HelpFunctionsLibrary.py
Resource    ../resourses/CommonKeywords.robot
Resource    ../resourses/LoginPageKeywords.robot
Variables    ../variables/MainPageVariables.py
Variables    ../variables/CommonVariables.py


*** Keywords ***
Open Main Page,Accept Cookies and Close Promo Window
    Open main page    ${url}    ${browser_name}
    ${element1}=    Run Keyword And Return Status    Assert Element    ${accept_cookies_button}    clickable=True
    Run Keyword If    ${element1}    click element    ${accept_cookies_button}
    ${element2}=    Run Keyword And Return Status    Assert Element    ${close_promo_window_button}    clickable=True
    Run Keyword If    ${element2}    click element    ${close_promo_window_button}

Open Main Page,Accept Cookies,Close Promo Window and Go to Registration Page
    Open Main Page,Accept Cookies and Close Promo Window
    Go to Registration Page

Open Main Page,Accept Cookies,Close Promo Window,Go to Login Page and Login
    Open Main Page,Accept Cookies and Close Promo Window
    Go to Login Page
    ${email}    ${password}=    load credentials
    Login    ${email}    ${password}

Find by search string
    [Arguments]    ${input_word}
    input text    ${search_string}    ${input_word}
    FOR    ${index}    IN RANGE    10
         press keys    ${search_string}    RETURN
         ${element_visible}=    Run Keyword And Return Status    element should be visible    ${header_search_text}
         Exit For Loop If    ${element_visible}
    END

Go to Registration Page
    Hover over element    ${account_icon}
    click element    ${create_account_button}
    click element    ${no_hebe_card_button}

Go to Login Page
    click element    ${account_icon}

Logout from account
    Hover over element    ${account_icon}
    click element    ${logout_button}

Add Item to Favourites
    [Arguments]    ${input_word}
    Find by search string    ${input_word}
    Hover over element    ${first_product}
    click element    ${add_to_favorites_button}
    wait for condition    return jQuery.active == 0

Go to Favourites Page
    click element    ${favorites_quantity_icon}

Add Item to Cart
    [Arguments]    ${input_word}
    Find by search string    ${input_word}
    click element    ${first_product}
    click element    ${add_to_cart_button}

Go to Cart Page
    ${go_to_cart_element}=    Run Keyword And Return Status    Assert Element    ${go_to_cart_button}    clickable=True
    run keyword if    ${go_to_cart_element}
    ...    click element    ${go_to_cart_button}
    ...    ELSE
    ...    click element    ${cart_icon}
