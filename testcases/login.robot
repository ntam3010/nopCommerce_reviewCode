*** Settings ***
Resource            ../resources/import.resource
Variables           ../resources/account_data.yaml

Test Setup          Open The Home Page
Test Teardown       Close Browser Window

*** Test Cases ***
Successfully logged in
    [Documentation]    Verify that the user login successfully to the system with the correct credentials
    header_navigation.Click on Login link
    login_page.Login With    ${user_login01.email_address}    ${user_login01.password}
    header_navigation.Verify Log out Link Appears