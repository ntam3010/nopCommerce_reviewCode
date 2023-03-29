*** Settings ***
Library                SeleniumLibrary
Resource               ../resources/config.resource

*** Keywords ***
Open The Home Page
    Open Browser    ${base_url}    ${selected_browser}
    Maximize Browser Window

Close Browser Window
    Close Browser

Open The Login Page
    Open Browser    ${base_url}${login_page}    ${selected_browser}
    Maximize Browser Window

Open The Register Page
    Open Browser    ${base_url}${register_page}    ${selected_browser}
    Maximize Browser Window