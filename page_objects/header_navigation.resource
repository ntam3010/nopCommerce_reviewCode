*** Settings ***
Library    SeleniumLibrary
Variables    ../page_objects/web_locators/header_navigation_locators.py
*** Keywords ***
Verify Log Out Link Appears
    Element Should Be Visible    ${logout_link}

Click On Login Link
    Wait Until Element Is Enabled    ${login_link}
    Click Element    ${login_link}

Click On My Account Link
    Wait Until Element Is Enabled    ${myaccount_link}
    Click Element    ${myaccount_link}

Click On Logout Link
    Wait Until Element Is Enabled    ${logout_link}
    Click Element    ${logout_link}