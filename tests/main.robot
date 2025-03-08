*** Settings ***
*** Settings ***
Library           SeleniumLibrary
Library           ../resources/settings.py
Resource          ../resources/keywords.robot

*** Variables ***
${url}            https://www.bigbasket.com
${browser}        Chrome

*** Test Cases ***
Open Browser And Search In BigBasket
    [Documentation]    Open Chrome browser and navigate to BigBasket, select electronics category, and list products
    Open Browser And Search In BigBasket    ${url}    ${browser}
    Log To Console    testing