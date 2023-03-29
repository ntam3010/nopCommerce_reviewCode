*** Settings ***
Library    SeleniumLibrary

Variables    ../env_conf.py
Variables    ../constant/url_constants.py
Variables    ../page_objects/web_locators/login_page_locators.py
# Variables    ../test_data/default_data.yaml

Resource    ../utils/data_helper.resource
Resource    ../browser/browser.resource
Resource    ../page_objects/header_navigation.resource
Resource    ../page_objects/register_page.resource

*** Keywords ***
Verify Page Title of Login Page
    Element Text Should Be    ${page_title}    Welcome, Please Sign In!

Input Email To Login
    [Arguments]    ${login_email}
    Wait Until Element Is Enabled    ${login_email_txt}
    Input Text    ${login_email_txt}    ${login_email}

Input Password To Login
    [Arguments]    ${login_pwd}
    Wait Until Element Is Enabled    ${login_password_txt}
    Input Text    ${login_password_txt}    ${login_pwd}

Click Login Button
    Wait Until Element Is Enabled    ${login_btn}
    Click Button    ${login_btn}

Login With
    [Arguments]    ${login_email}    ${login_pwd}
    Verify Page Title of Login Page
    Input Email To Login    ${login_email}
    Input Password To Login    ${login_pwd}
    Click Login Button

Login Successfully With
    [Arguments]    ${login_email}    ${login_pwd}
    Login With    ${login_email}    ${login_pwd}
    Verify Log Out Link Appears

Verify Error Message When Password Is Incorrect
    Element Text Should Be    ${login_error_msg}    The credentials provided are incorrect

Open The Login Page
    Open Browser    ${base_url}${login_path}    ${selected_browser}
    Maximize Browser Window