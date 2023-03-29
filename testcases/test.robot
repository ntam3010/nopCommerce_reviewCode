*** Settings ***
Library        SeleniumLibrary
Library        String
Resource    ../page_objects/login_page.resource

*** Variables ***
${random_str}

*** Test Cases ***
Test script
    ${random_str}    Generate Random String    8    [LOWER]
    Log To Console   ${random_str}123123123123