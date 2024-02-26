*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/CommonKeywords.robot
Variables    ../variables/FavouritesPageVariables.py

*** Keywords ***
Delete One Item from Favourites
    click element    ${favorites_heart_button}

Count Items in Favourites
    ${items_in_favorites}=    Assert Element    ${products_in_favorites}    return_many=True
    ${items_quantity}=    Get Length    ${items_in_favorites}
    RETURN    ${items_quantity}

Go to Main Page
    go to    https://www.hebe.pl/
