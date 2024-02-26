*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/MainPageKeywords.robot
Resource    ../resourses/LoginPageKeywords.robot
Resource    ../resourses/FavouritesPageKeywords.robot
Variables    ../variables/MainPageVariables.py
Variables    ../variables/FavouritesPageVariables.py
Documentation    This test suite contains tests for the Favourites page functionality.
Default Tags    Smoke
Suite Setup    Open Main Page,Accept Cookies,Close Promo Window,Go to Login Page and Login
Suite Teardown    Close Browser
Test Teardown    Go to Main Page

*** Test Cases ***
Add to Favourites
    [Documentation]    This test case verifies the functionality of adding items to the Favourites.
    Add Item to Favourites    LASH
    element text should be    ${favorites_quantity_icon}    1
    ${favorites_heart_button_color}=    Extract Element CSS Property    ${favorites_heart_button}    fill
    should be equal    ${favorites_heart_button_color}    rgb(232, 0, 128)
    Go to Favourites Page
    Assert Element    ${products_in_favorites}
    Delete One Item from Favourites

Delete from Favourites
    [Documentation]    This test case verifies the functionality of deleting items from the Favourites.
    Add Item to Favourites    LASH
    clear element text    ${search_string}
    Add Item to Favourites    BROW
    Go to Favourites Page
    ${items_quantity}=    Count Items in Favourites
    should be equal as integers    ${items_quantity}    2
    Delete One Item from Favourites
    wait until element is not visible    ${removed_product}
    ${items_quantity_new}=    Count Items in Favourites
    should be equal as integers    ${items_quantity_new}    1
    Delete One Item from Favourites
    wait until element is visible    ${empty_favorites_notification}
    element text should be    ${empty_favorites_notification}    Na tej liście życzeń nie ma żadnych produktów.






