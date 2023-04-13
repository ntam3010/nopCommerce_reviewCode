*** Settings ***
Library    DateTime

*** Keywords ***
Generate Random Email Based On DateTime
    ${current_time}=    Get Current Date
    ${conver_time}=    Convert Date    ${current_time}    epoch
    Log To Console    ${conver_time}
    ${random_email}=    Catenate    SEPARATOR=    ${conver_time}    @mailinator.com
    RETURN    ${random_email}