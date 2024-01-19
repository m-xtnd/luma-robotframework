*** Settings ***
Library  SeleniumLibrary
Test Setup    Run Keywords    Open Browser    https://www.google.com/    chrome
...    AND    Open    ${BASE_URL}
...    AND    Set Selenium Speed  ${SELSPEED}
Test Teardown    Close Browser

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  0.5s
${BASE_URL}    https://magento.softwaretestingboard.com/
${EMAIL}    xixixi@xixixi.xixi
${PASSWORD}    Password!
${expected_total}
${delete_item}    link=Remove item

*** Test Cases ***

testCase
    Maximize Browser Window
    # Create account    ${BASE_URL}    ${EMAIL}    ${PASSWORD}
    # Logout
    # Login    ${BASE_URL}    ${EMAIL}    ${PASSWORD}
    Add 4 items
    Count items numbers   4
    Remove items from cart
    Count items numbers   2
    Remove all items from card
    Count items numbers    0
    # Logout

*** Keywords ***
Create account
    [Arguments]    ${BASE_URL$}    ${EMAIL}    ${PASSWORD}
    open    ${BASE_URL}
    click    link=Create an Account
    click    id=firstname
    type    id=firstname    xxx
    click    id=lastname
    type    id=lastname    xxx
    type    id=email_address    ${EMAIL}
    click    id=password
    type    id=password    ${PASSWORD}
    click    id=password-confirmation
    type    id=password-confirmation    ${PASSWORD}
    click    xpath=//form[@id='form-validate']/div/div/button/span


Logout
    click    xpath=//img[contains(@src,'https://magento.softwaretestingboard.com/pub/static/version1695896754/frontend/Magento/luma/en_US/images/logo.svg')]
    open    https://magento.softwaretestingboard.com/
    click    xpath=//button[@type='button']
    click    link=Sign Out


Login
    [Arguments]    ${BASE_URL}   ${EMAIL}    ${PASSWORD}
    open    ${BASE_URL}
    click    link=Sign In
    click    id=email
    type    id=email    ${EMAIL}
    click    id=pass
    type    id=pass    ${PASSWORD}
    click    xpath=//button[@id='send2']/span

Add 4 items
    click    xpath=//a[@id='ui-id-4']/span[2]
    click    id=option-label-size-143-item-171
    click    id=option-label-color-93-item-52
    Set Selenium Implicit Wait    0.2 second
    click    xpath=//main[@id='maincontent']/div[4]/div/div[2]/div[3]/div/div/ol/li[4]/div/div/div[3]/div/div/form/button/span
    click    xpath=//a[@id='ui-id-5']/span[2]
    click    id=option-label-size-143-item-168
    click    id=option-label-color-93-item-52
    click    xpath=//main[@id='maincontent']/div[4]/div/div[2]/div[3]/div/div/ol/li/div/div/div[3]/div/div/form/button/span
    click    xpath=//a[@id='ui-id-6']/span[2]
    click    (//span[@class='ui-menu-icon ui-icon ui-icon-carat-1-e'])[7]
    open    https://magento.softwaretestingboard.com/gear/watches.html
    Mouse Over    //body/div[@class='page-wrapper']/main[@id='maincontent']/div[@class='columns']/div[@class='column main']/div[@class='products wrapper grid products-grid']/ol[@class='products list items product-items']/li[5]/div[1]
    Set Selenium Implicit Wait    0.2 second
    click    (//span[contains(text(),'Add to Cart')])[5]
    Mouse Over    //body/div[@class='page-wrapper']/main[@id='maincontent']/div[@class='columns']/div[@class='column main']/div[@class='products wrapper grid products-grid']/ol[@class='products list items product-items']/li[8]/div[1]
    Set Selenium Implicit Wait    0.2 second
    click    (//span[contains(text(),'Add to Cart')])[8]


Remove items from cart
    click    //a[@class='action showcart']
    open    https://magento.softwaretestingboard.com/checkout/cart/
    click   ${delete_item}
    Set Selenium Implicit Wait    0.2 second
    click   ${delete_item}

Count items numbers
    [Arguments]    ${expected_total}
    open    https://magento.softwaretestingboard.com/checkout/cart/
    ${total_quantity}    Set Variable    0
    ${article_elements}    Get WebElements    xpath=//header[@class='page-header']/div[@class='header content']/div/div/div/div/div/div[4]/ol/li

    FOR    ${element}    IN    @{article_elements}
        ${quantity}    Get Element Attribute    //header[@class='page-header']/div[@class='header content']/div/div/div/div/div/div[4]/ol/li/div/div/div[@class='product-item-pricing']/div[2]/input    data-item-qty
        Log    Quantité: ${quantity}
        ${total_quantity}    Evaluate    ${total_quantity} + int(${quantity})
    END

    Log    Nombre total d'elements dans le panier: ${total_quantity}
    Should Be Equal As Numbers    ${total_quantity}    ${expected_total}

Remove all items from card
    ${article_elements}    Get WebElements    xpath=//header[@class='page-header']/div[@class='header content']/div/div/div/div/div/div[4]/ol/li
    open    https://magento.softwaretestingboard.com/checkout/cart/
    click   link=Remove item
    Set Selenium Implicit Wait    0.2 second
    click   link=Remove item

    ${count_deleted_items}    Get Element Count    ${delete_item}

    WHILE    ${count_deleted_items} > 0
        click    ${delete_item}
        Wait Until Page Contains Element    ${${delete_item}}
        Wait Until Page Does Not Contain    ${delete_item}
    END



open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
