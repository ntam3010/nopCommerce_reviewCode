*** Settings ***
Library    SeleniumLibrary
Variables    ../page_objects/web_locators/change_password_page_locators.py
Variables    ../test_data/default_data.yaml
Resource    register_page.resource
Resource    header_navigation.resource
Resource    ../utils/data_helper.resource
Resource    login_page.resource

*** Keywords ***
Verify Page Title of Change Password Page
    Element Text Should Be    ${page_title}    My account - Change password

Input Old Password
    [Arguments]    ${old_pwd_value}
    Input Password    ${old_pwd_txt}    ${old_pwd_value}

Input New Password
    [Arguments]    ${new_pwd_value}
    Input Password    ${new_pwd_txt}    ${new_pwd_value}

Input Confirm New Password
    [Arguments]    ${confirm_new_pwd_value}
    Input Password    ${confirm_new_pwd_txt}    ${confirm_new_pwd_value}

Click Change Password Button
    Click Button    ${change_pwd_btn}

Input Old And New Password Then Click Change Password Button
    [Arguments]    ${old_pwd_value}    ${new_pwd_value}    ${confirm_new_pwd_value}
    Input Old Password    ${old_pwd_value}
    Input New Password    ${new_pwd_value}
    Input Confirm New Password    ${confirm_new_pwd_value}
    Click Change Password Button

Login And Change Password Successful
    [Arguments]    ${login_email}    ${login_password}    ${new_pwd_value}
    Go To    ${base_url}${login_path}
    Login Successfully With    ${login_email}    ${login_password}
    Go To    ${base_url}${change_pwd_path}
    Verify Page Title of Change Password Page
    Input Old And New Password Then Click Change Password Button    ${login_password}    ${new_pwd_value}    ${new_pwd_value}
    Close Change Password Success Message
    Wait Until Element Is Not Visible    ${bar_notification}

Verify Change Password Success Message
    Element Text Should Be    ${bar_notification}    Password was changed

Close Change Password Success Message
    Click Element    ${bar_notification_x_btn}

Wait Until Change Password Success Message Disappears
    Wait Until Element Is Not Visible    ${bar_notification}

Verify Error If Password Is Recent Used
    Element Text Should Be    ${change_pwd_summary_errors}  
    ...    You entered the password that is the same as one of the last passwords you used. Please create a new password.

Register User Then Reach Change Password Page
    Open The Register Page
    Verify Page Title Of Register Page
    ${register_email}=    Generate Random Email Based On DateTime
    Input Required Data Into Register Form    ${default_user_data.firstName}    ${default_user_data.lastName}  
    ...    ${register_email}    ${default_user_data.password}    ${default_user_data.password}
    Click Register Button
    Click Continue Button After Registered
    Go To    ${base_url}${login_path}
    Login With    ${register_email}    ${default_user_data.password}
    Verify Log Out Link Appears
    Go To    ${base_url}${change_pwd_path}
    Verify Page Title of Change Password Page


#Verify the error messages that displayed for the releval textboxes
Verify Error Message Of Old Password
    [Arguments]    ${error_message}
    Element Text Should Be    ${old_pwd_error}    ${error_message}

Verify Error Message Of New Password
    [Arguments]    ${error_message}
    Element Text Should Be    ${new_pwd_error}    ${error_message}

Verify Error Message Of Confirm New Password
    [Arguments]    ${error_message}
    Element Text Should Be    ${confirm_new_pwd_error}    ${error_message}

Verify Summary Error Message
    [Arguments]    ${error_message}
    Element Text Should Be    ${change_pwd_summary_errors}    ${error_message}