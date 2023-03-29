*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${register_link}            xpath://a[contains(text(),'Register')]
${login_link}               xpath://a[contains(text(),'Log in')]
${logout_link}              xpath://a[contains(text(),'Log out')]
${myaccount_link}           xpath://a[contains(text(),'My account')]


*** Keywords ***
Click On Register Link
    Click Element    ${register_link}
    register_page.Verify Page Title Of Register Page

Click On Login Link
    Click Element    ${login_link}
    login_page.Verify Page Title of Login Page

Click On Logout Link
    Wait Until Element Is Enabled    ${logout_link}
    Click Element    ${logout_link}
 
Click On My Account Link
    Click Element    ${myaccount_link}

Verify Log Out Link Appears
    [Documentation]    To verify logging in is successful
    Element Should Be Visible    ${logout_link}
