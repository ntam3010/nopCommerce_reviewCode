*** Settings ***
Resource         ../resources/import.resource
Variables        ../resources/account_data.yaml

*** Variables ***
${change_password_link}            xpath://a[contains(text(),'Change password')]

*** Keywords ***
Click Change Password Link
    Click Element    ${change_password_link}

Reach My Account Page After Logged In
    Open The Login Page
    Login With    ${user_login01.email_address}    ${user_login01.password}
    Verify Log Out Link Appears
    Click On My Account Link