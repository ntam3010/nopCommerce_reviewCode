*** Settings ***
Library    SeleniumLibrary
Variables    ../page_objects/web_locators/my_account_page_locators.py

*** Keywords ***
Click On Change Password Link
    Wait Until Element Is Enabled    ${change_password_link}
    Click Element    ${change_password_link}