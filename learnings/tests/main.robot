*** Settings ***
*** Settings ***
Library           SeleniumLibrary
Library    Collections
#Library           ../learnings/resources/settings.py
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
${cigna}       Dental  SI  coreops
&{employees}      Dental=36  SI=20  coreops=10
${shopcate}    //*[@id="headlessui-menu-button-:R5bab6:"]


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
    Should Be Equal    ${value}    5    #Intentionally Failed 

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

# Test Ten
#     Open Browser  ${url}  ${browser}
#     Wait Until Page Contains    category
#     Maximize Browser Window
#     Click Element    ${shopcate}
#     ${options}=    Get WebElements    //*[@id="headlessui-menu-items-:R9bab6:"]//a
#             FOR  ${option}  IN  @{options}
#             ${text}=    Get Text    ${option}
#             Log To Console    category: ${text}
#             Run Keyword If    '${text}' == 'Home Appliances'    Click Element    ${option}
#         END
#         Run Keyword If    '${text}' != 'Home Appliances'    Log To Console    No such category found
#         Close Browser

Test Ten
    Open Browser  ${url}  ${browser}
    Wait Until Page Contains    category
    Maximize Browser Window
    Click Element    ${shopcate}
    ${options}=    Get WebElements    //*[@id="headlessui-menu-items-:R9bab6:"]//a
    ${count}=   Get Length    ${options}
    Log To Console    Found ${count} categories
    FOR    ${index}    IN RANGE    ${count}
        ${option}=    Get WebElement    xpath=(//*[@id="headlessui-menu-items-:R9bab6:"]//a)[${index + 1}]    # Re-fetch each time
        ${text}=    Get Text    ${option}
        Log To Console    category: ${text}
        Run Keyword If    '${text}' == 'Home Appliances'    Click Element    ${option}
        Run Keyword If    '${text}' == 'Home Appliances'    Log To Console    Clicked Home Appliances
    END
