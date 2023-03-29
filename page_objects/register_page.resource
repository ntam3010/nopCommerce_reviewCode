*** Settings ***
Library            SeleniumLibrary
Resource           ../browser/browser.resource

*** Variables ***
${page_title}                 xpath://div[@class='page-title']/h1
${firstName_txt}              css:input#FirstName
${lastName_txt}               css:input#LastName
${email_txt}                  css:input#Email
${pwd_txt}                    css:input#Password
${confirm_pwd_txt}            css:input#ConfirmPassword
${register_btn}               css:button#register-button
${register_complete_msg}      css:div.result


*** Keywords ***    
Verify Page Title Of Register Page
    Element Text Should Be    ${page_title}    Register

Input First Name
    [Arguments]    ${first_name_value}
    Input Text    ${firstName_txt}    ${first_name_value}

Input Last Name
    [Arguments]    ${last_name_value}
    Input Text    ${lastName_txt}    ${last_name_value}

Input Email
    [Arguments]    ${email_value}
    Input Text    ${email_txt}    ${email_value}

Input Password Value
    [Arguments]    ${pwd_value}
    Input Password    ${pwd_txt}    ${pwd_value}

Input Confirm Password Value
    [Arguments]    ${confirm_pwd}
    Input Password    ${confirm_pwd_txt}    ${confirm_pwd}

Click Register Button
    Click Button    ${register_btn}

Verify Successful Registration
    Element Should Be Visible    ${register_complete_msg}

Register With Required Data
    [Arguments]    ${first_name_value}  ${last_name_value}  ${email_value}  ${pwd_value}  ${confirm_pwd}
    Input First Name    ${first_name_value}
    Input Last Name    ${last_name_value}
    Input Email    ${email_value}
    Input Password Value    ${pwd_value}
    Input Confirm Password Value    ${confirm_pwd}
    Click Register Button
