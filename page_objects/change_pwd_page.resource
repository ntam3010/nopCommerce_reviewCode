*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${page_title}                    css:div.page-title
${old_pwd_txt}                   css:input#OldPassword
${new_pwd_txt}                   css:input#NewPassword
${confirm_new_pwd_txt}           css:input#ConfirmNewPassword
${change_pwd_btn}                xpath://button[contains(text(),'Change password')]
${bar_notification}              xpath://div[@id='bar-notification']/div/p
${bar_notification_x_btn}        css:span.close
${change_pwd_summary_errors}     css:div.validation-summary-errors
${old_pwd_error}                 css:span#OldPassword-error
${new_pwd_error}                 css:span#NewPassword-error
${confirm_new_pwd_error}         css:span#ConfirmNewPassword-error


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

Verify Change Password Success Message
    Element Text Should Be    ${bar_notification}    Password was changed

Close Change Password Success Message
    Click Element    ${bar_notification_x_btn}

Verify Change Password Success Message Disappear
    Element Should Not Be Visible    ${bar_notification}

Verify Error If Password Is Recent Used
    Element Text Should Be    ${change_pwd_summary_errors}  
    ...    You entered the password that is the same as one of the last passwords you used. Please create a new password.

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
