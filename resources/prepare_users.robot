*** Settings ***
Resource                ../resources/import.resource

Library                 DataDriver    file=prepare_users_data.csv

Suite Setup             Open The Home Page
Suite Teardown          Close Browser Window
Test Template           Register New User With All Required Data

*** Test Cases ***
Register multi users following given data    ${email_value}  ${first_name_value}  ${last_name_value}  ${pwd_value}

*** Keywords ***
Register New User With All Required Data
    [Arguments]    ${email_value}  ${first_name_value}  ${last_name_value}  ${pwd_value}
    
    header_navigation.Click on Register link
    register_page.Input First Name    ${first_name_value}
    register_page.Input Last Name    ${last_name_value}
    register_page.Input Email    ${email_value}
    register_page.Input Password Value    ${pwd_value}
    register_page.Input Confirm Password Value    ${pwd_value}
    register_page.Click Register Button
    register_page.Verify Successful Registration