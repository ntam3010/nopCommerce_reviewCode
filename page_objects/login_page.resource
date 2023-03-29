*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${page_title}                 xpath://div[@class='page-title']/h1
${email_txt}                  css:input#Email
${password_txt}               css:input#Password
${remember_checkbox}          css:input#RememberMe
${login_btn}                  xpath://button[contains(text(),'Log in')]
${login_error_msg}            xpath://div[@class='message-error validation-summary-errors']/ul/li

*** Keywords ***
Verify Page Title of Login Page
    Element Text Should Be    ${page_title}    Welcome, Please Sign In!

Input Email To Login
    [Arguments]    ${login_email}
    Input Text    ${email_txt}    ${login_email}

Input Password To Login
    [Arguments]    ${login_pwd}
    Input Text    ${password_txt}    ${login_pwd}

Select Remember Checkbox
    Select Checkbox    ${remember_checkbox}

Click Login Button
    Click Button    ${login_btn}

Login With
    [Arguments]    ${login_email}    ${login_pwd}
    Input Email To Login    ${login_email}
    Input Password To Login    ${login_pwd}
    Click Login Button

Verify Error Message When Password Is Incorrect
    Element Text Should Be    ${login_error_msg}    The credentials provided are incorrect

# Register New User Then Login
#     Open The Register Page
#     ${random_email}=    Generate Random String
#     ${new_email}=    ${random_email}@mailinator.com
#     Register With Required Data    ${default_firstName}    ${default_lastName}  
#     ...    ${new_email}    ${default_pwd}    ${default_pwd}
#     Click On Login Link
#     Login With    ${new_email}    ${default_pwd}
