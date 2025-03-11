*** Settings ***
*** Settings ***
Library           SeleniumLibrary
Library           ../learnings/resources/settings.py
Resource          ../resources/keywords.robot

*** Variables ***
${url}            https://www.bigbasket.com
${browser}        Chrome

*** Test Cases ***
Open Browser And Search In BigBasket
    [Documentation]    Open Chrome browser and navigate to BigBasket, select electronics category, and list products
    Open Browser And Search In BigBasket    ${url}    ${browser}
    log to console  bigbasket select is success

Test Two
    Log    Becoming a Robot Framework Engineer!

Test Three
   ${result}=  Evaluate   5+3
   Should Be Equal As Integers    ${result}    8

Test Four
    ${text}=  Set Variable  Robotframework
    Should Contain    ${text}    Robot

Test five
    ${value}=  Set Variable  10
    Should Be Equal    ${value}    5
    
    