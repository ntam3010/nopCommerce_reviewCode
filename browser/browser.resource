*** Settings ***
Library    SeleniumLibrary
Variables    ../env_conf.py
Variables    ../constant/url_constants.py

*** Keywords ***
Open The Home Page
    Open Browser    ${base_url}    ${selected_browser}
    Maximize Browser Window

Close Browser Window
    Close Browser