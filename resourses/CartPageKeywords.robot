*** Settings ***
Library    SeleniumLibrary
Resource    ../resourses/CommonKeywords.robot
Variables    ../variables/CartPageVariables.py

*** Keywords ***
Delete Item from Cart
    Hover over element    ${first_item_in_cart}
    click element    ${delete_item_from_cart_button}

Get Total
    ${total_in_cart_text}=    Get Text    ${total_in_cart}
    ${total}=    Evaluate    float('${total_in_cart_text}'.replace(',', '.')[:-3])
    RETURN    ${total}

Count Items in Cart
    ${items}=    Assert Element    ${items_in_cart}    return_many=True
    ${items_quantity}=    Get Length    ${items}
    RETURN    ${items_quantity}

Go to Main Page
    click element    ${go_to_main_page_button}
