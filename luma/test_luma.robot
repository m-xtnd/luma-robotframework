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
${EMAIL}    xixixi@xixixi.xixix
${PASSWORD}    Password!

*** Test Cases ***

testCase_without_accountCreation
    Maximize Browser Window
    # Create account    ${BASE_URL}    ${EMAIL}    ${PASSWORD}
    # Logout
    # Login    ${BASE_URL}    ${EMAIL}    ${PASSWORD}
    Add 4 items
    Remove items from cart
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
    Set Selenium Implicit Wait    0.5 second
    click    xpath=//main[@id='maincontent']/div[4]/div/div[2]/div[3]/div/div/ol/li[4]/div/div/div[3]/div/div/form/button/span
    click    xpath=//a[@id='ui-id-5']/span[2]
    click    id=option-label-size-143-item-168
    click    id=option-label-color-93-item-52
    click    xpath=//main[@id='maincontent']/div[4]/div/div[2]/div[3]/div/div/ol/li/div/div/div[3]/div/div/form/button/span
    click    xpath=//a[@id='ui-id-6']/span[2]
    click    (//span[@class='ui-menu-icon ui-icon ui-icon-carat-1-e'])[7]
    open    https://magento.softwaretestingboard.com/gear/watches.html
    Mouse Over    (//img[@alt='Dash Digital Watch'])[1]
    click    (//span[contains(text(),'Add to Cart')])[5]
    Mouse Over    (//img[@alt='Endurance Watch'])[1]
    Set Selenium Implicit Wait    0.5 second
    click    (//span[contains(text(),'Add to Cart')])[8]


Remove items from cart
    click    .action.showcart
    click    //button[@id='top-cart-btn-checkout']
    open    https://magento.softwaretestingboard.com/checkout/cart/
    click    link=Remove item
    click    xpath=//table[@id='shopping-cart-table']/tbody[3]/tr[2]/td/div/a[3]

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
