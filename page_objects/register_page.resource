*** Settings ***
Library    SeleniumLibrary
Variables    ../page_objects/web_locators/register_page_locators.py
Variables    ../env_conf.py
Variables    ../constant/url_constants.py

*** Keywords ***
Open The Register Page
    Open Browser    ${base_url}${register_path}    ${selected_browser}
    Maximize Browser Window

Verify Page Title Of Register Page
    Element Text Should Be    ${page_title}    Register

Input First Name
    [Arguments]    ${first_name_value}
    Wait Until Element Is Enabled    ${firstName_txt}
    Input Text    ${firstName_txt}    ${first_name_value}

Input Last Name
    [Arguments]    ${last_name_value}
    Wait Until Element Is Enabled    ${lastName_txt}
    Input Text    ${lastName_txt}    ${last_name_value}

Input Email
    [Arguments]    ${email_value}
    Wait Until Element Is Enabled    ${email_txt}
    Input Text    ${email_txt}    ${email_value}

Input Password Value
    [Arguments]    ${pwd_value}
    Wait Until Element Is Enabled    ${pwd_txt}
    Input Password    ${pwd_txt}    ${pwd_value}

Input Confirm Password Value
    [Arguments]    ${confirm_pwd}
    Wait Until Element Is Enabled    ${confirm_pwd_txt}
    Input Password    ${confirm_pwd_txt}    ${confirm_pwd}

Click Register Button
    Wait Until Element Is Enabled    ${register_btn}
    Click Button    ${register_btn}

Verify Successful Registration
    Element Should Be Visible    ${register_complete_msg}

Click Continue Button After Registered
    Wait Until Element Is Enabled    ${register_continue_btn}
    Click Element    ${register_continue_btn}

Input Required Data Into Register Form
    [Arguments]    ${first_name_value}  ${last_name_value}  ${email_value}  ${pwd_value}  ${confirm_pwd}
    Input First Name    ${first_name_value}
    Input Last Name    ${last_name_value}
    Input Email    ${email_value}
    Input Password Value    ${pwd_value}
    Input Confirm Password Value    ${confirm_pwd}