*** Settings ***
Resource    ../../browser/browser.resource
Resource    ../../page_objects/header_navigation.resource
Resource    ../../page_objects/register_page.resource
Resource    ../../page_objects/login_page.resource
Resource    ../../page_objects/change_password_page.resource
Resource    ../../page_objects/my_account_page.resource

Variables    ../../test_data/default_data.yaml

Test Setup    Open The Register Page
Test Teardown    Close Browser Window
*** Test Cases ***
Successfully changed password then re-login
    [Documentation]    
    ...        1. Successfully changed password    
    ...        2. Able to close the Change Password Success Message
    ...        3. Able to login with new password
    ${register_email}=    Generate Random Email Based On DateTime
    Input Required Data Into Register Form    ${default_user_data.firstName}    ${default_user_data.lastName}  
    ...    ${register_email}    ${default_user_data.password}    ${default_user_data.password}
    Click Register Button
    Click Continue Button After Registered
    Click On Login Link
    Login Successfully With    ${register_email}    ${default_user_data.password}
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${default_user_data.password}    ${password_data.changed_01}    ${password_data.changed_01}
    Verify Change Password Success Message
    Close Change Password Success Message
    Wait Until Change Password Success Message Disappears
    Click On Logout Link
    Click On Login Link
    Login Successfully With    ${register_email}    ${password_data.changed_01}

Unable to change password twice in a row
    [Documentation]    User is redirected to Login page when trying to change password twice in a row
    ${register_email}=    Generate Random Email Based On DateTime
    Input Required Data Into Register Form    ${default_user_data.firstName}    ${default_user_data.lastName}  
    ...    ${register_email}    ${default_user_data.password}    ${default_user_data.password}
    Click Register Button
    Click Continue Button After Registered
    Click On Login Link
    Login With    ${register_email}    ${default_user_data.password}
    Verify Log Out Link Appears
    Click On My Account Link
    Click On Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${default_user_data.password}    ${password_data.changed_01}    ${password_data.changed_01}
    Verify Change Password Success Message
    Input Old And New Password Then Click Change Password Button  
    ...    ${password_data.changed_01}    ${password_data.changed_02}    ${password_data.changed_02}
    Verify Page Title of Login Page

Unable to change back password to the 3 recent used
    [Documentation]    User is not able to change password back to last 3 used passwords
    ${register_email}=    Generate Random Email Based On DateTime
    Input Required Data Into Register Form    ${default_user_data.firstName}    ${default_user_data.lastName}  
    ...    ${register_email}    ${default_user_data.password}    ${default_user_data.password}
    Click Register Button
    Click Continue Button After Registered
    Login And Change Password Successful    ${register_email}    ${default_user_data.password}    ${password_data.changed_01}
    Click On Logout Link
    Login And Change Password Successful    ${register_email}    ${password_data.changed_01}    ${password_data.changed_02}
    Click On Logout Link
    Login And Change Password Successful    ${register_email}    ${password_data.changed_02}    ${password_data.changed_03}
    Click On Logout Link
    Login And Change Password Successful    ${register_email}    ${password_data.changed_03}    ${password_data.changed_04}
    Click On Logout Link
    Go To    ${base_url}${login_path}
    Login With    ${register_email}    ${password_data.changed_04}
    Go To    ${base_url}${change_pwd_path}
    Input Old And New Password Then Click Change Password Button  
    ...    ${password_data.changed_04}    ${password_data.changed_03}    ${password_data.changed_03}
    Verify Error If Password Is Recent Used
    Input Old And New Password Then Click Change Password Button  
    ...    ${password_data.changed_04}    ${password_data.changed_02}    ${password_data.changed_02}
    Verify Error If Password Is Recent Used
    Input Old And New Password Then Click Change Password Button  
    ...    ${password_data.changed_04}    ${password_data.changed_01}    ${password_data.changed_01}
    Input Old And New Password Then Click Change Password Button  
    ...    ${password_data.changed_04}    ${default_user_data.password}    ${default_user_data.password}
    Verify Change Password Success Message