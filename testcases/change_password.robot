*** Settings ***
Resource    ../resources/import.resource
Variables    ../resources/account_data.yaml


Test Setup          Open The Login Page
Test Teardown       Close Browser Window

*** Test Cases ***
Successfully changed password then re-login
    [Documentation]    
    ...        1. Successfully changed password    
    ...        2. Verify the Change Password Success Message totally disappear
    ...        3. Not able to login with old password
    ...        4. Able to login with new password
    Login With    ${user_change_pwd_01.email_address}    ${user_change_pwd_01.old_pwd}
    Verify Log Out Link Appears
    Click On My Account Link
    Click Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${user_change_pwd_01.old_pwd}    ${user_change_pwd_01.new_pwd}    ${user_change_pwd_01.new_pwd}
    Verify Change Password Success Message
    Close Change Password Success Message
    # The message disappears slowly after clicking on the X button
    Wait Until Keyword Succeeds    5s    0.5s    Verify Change Password Success Message Disappear
    Click On Logout Link
    Click On Login Link
    Login With    ${user_change_pwd_01.email_address}    ${user_change_pwd_01.old_pwd}
    Verify Error Message When Password Is Incorrect
    Login With    ${user_change_pwd_01.email_address}    ${user_change_pwd_01.new_pwd}
    Verify Log Out Link Appears
    
Unable to change password twice in a row
    [Documentation]    User is redirected to Login page when trying to change password twice in a row      
    Login With    ${user_change_pwd_02.email_address}    ${user_change_pwd_02.old_pwd}
    Verify Log Out Link Appears
    Click On My Account Link
    Click Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${user_change_pwd_02.old_pwd}    ${user_change_pwd_02.new_pwd_01}    ${user_change_pwd_02.new_pwd_01}
    Verify Change Password Success Message
    Input Old And New Password Then Click Change Password Button  
    ...    ${user_change_pwd_02.new_pwd_01}  ${user_change_pwd_02.new_pwd_02}    ${user_change_pwd_02.new_pwd_02}
    Verify Page Title of Login Page

Unable to change back password to the recent used
    Login With    ${user_change_pwd_03.email_address}    ${user_change_pwd_03.old_pwd}
    Verify Log Out Link Appears
    Click On My Account Link
    Click Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${user_change_pwd_03.old_pwd}    ${user_change_pwd_03.new_pwd}    ${user_change_pwd_03.new_pwd}
    Verify Change Password Success Message
    Close Change Password Success Message
    # The message disappears slowly after clicking on the X button
    Wait Until Keyword Succeeds    5s    0.5s    Verify Change Password Success Message Disappear
    Click On Logout Link
    Click On Login Link
    Login With    ${user_change_pwd_03.email_address}    ${user_change_pwd_03.new_pwd}
    Click On My Account Link
    Click Change Password Link
    Input Old And New Password Then Click Change Password Button  
    ...    ${user_change_pwd_03.new_pwd}    ${user_change_pwd_03.old_pwd}    ${user_change_pwd_03.old_pwd}
    Verify Error If Password Is Recent Used

