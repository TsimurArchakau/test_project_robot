*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/MainPageKeywords.robot
Resource    ../resourses/LoginPageKeywords.robot
Resource    ../resourses/CartPageKeywords.robot
Variables    ../variables/MainPageVariables.py
Variables    ../variables/CartPageVariables.py
Documentation    This test suite contains tests for the Cart page functionality.
Default Tags    Smoke
Suite Setup    Open Main Page,Accept Cookies,Close Promo Window,Go to Login Page and Login
Suite Teardown    Close Browser
Test Teardown    Go to Main Page

*** Test Cases ***
Add to Cart
    [Documentation]    This test case verifies the functionality of adding items to the Shopping Cart.
    Add Item to Cart    LIPS
    Go to Cart Page
    Assert Element    ${items_in_cart}
    element text should be    ${notification_in_cart}    TWÓJ KOSZYK (1 PRODUKT)
    Delete Item from Cart
    wait until element is not visible    ${first_item_in_cart}

Change Item Quantity in Cart
    [Documentation]    This test case verifies the functionality of changing item's quantity in the Chopping Cart.
    Add Item to Cart    GLOW
    Go to Cart Page
    ${first_total}=    Get Total
    click element    ${plus_button}
    wait until element contains    ${notification_in_cart}    TWÓJ KOSZYK (2 PRODUKTY)
    ${second_total}=    Get Total
    ${double_first_total}=    Evaluate    ${first_total} * 2
    should be equal    ${second_total}    ${double_first_total}
    Delete Item from Cart
    wait until element is not visible    ${first_item_in_cart}

Delete from Cart
    [Documentation]    This test case verifies the functionality of deleting items from the Shopping Cart.
    Add Item to Cart    LASH
    wait until element is visible    ${continue_shopping_button}
    click element    ${continue_shopping_button}
    Add Item to Cart    KREM
    Go to Cart Page
    ${items}=    Assert Element    ${items_in_cart}    return_many=True
    ${items_quantity}=    Count Items in Cart
    should be equal as integers    ${items_quantity}    2
    Delete Item from Cart
    wait until element is not visible    ${second_item_in_cart}
    ${items_quantity_new}=    Count Items in Cart
    should be equal as integers    ${items_quantity_new}    1
    Delete Item from Cart
    wait until element is not visible    ${first_item_in_cart}
    element text should be    ${empty_cart_notification}    Twój koszyk jest pusty


