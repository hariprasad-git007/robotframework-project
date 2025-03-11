*** Settings ***
*** Settings ***
Library           SeleniumLibrary
Library           ../learnings/resources/settings.py
Resource          ../resources/keywords.robot

*** Variables ***
${url}            https://www.bigbasket.com
${browser}        Chrome
@{browsers}       Chrome    Firefox    Edge
&{user}    name=Hari    role=Engineer    age=30    # Dictionary with 3 key-value pairs
@{names}    Hari  priya  Ravi
&{user1}    name=Hari  role=Engineer
&{user2}    name=priya  role=seniorEngineer
&{user3}    name=Ravi  role=Engineer

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
    Should Be Equal    ${value}    10

Test six
    ${Name}=  Set Variable  Hari
    Log   Hello,${Name}! Keep rocking Robot Framework

Test seven
    FOR  ${browsers}  IN    @{browsers}
        Open Browser    ${url}    ${browsers}
        Log To Console    Testing bigbasket in ${browsers}
        Close Browser
    END


Test Eight
    Log  Hello, ${user.name} you are ${user.age} years old and working as ${user.role}
    

Test Nine    #combination of both list and dict
    FOR  ${name}    IN  @{names}
        Log    checking names...
        Run Keyword If    '${name}' == 'Hari'      Log To Console   ${user1.role}
        Run Keyword If    '${name}' == 'priya'     Log To Console   ${user2.role}
    END
