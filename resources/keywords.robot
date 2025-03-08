*** Keywords ***
Open Browser And Search In BigBasket
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    sleep  5s
    Maximize Browser Window
    sleep  5s
    Click Element   //*[@id="headlessui-menu-button-:R5bab6:"]
    Click Element   //*[@id="headlessui-menu-items-:R9bab6:"]/nav/ul[1]/li[1]/a
    Sleep           2 seconds
    #${products}=    Get WebElements    //*[@id="headlessui-menu-items-:R9bab6:"]/nav/ul[2]
    #:FOR    ${product}    IN    @{products}
    #\    Log    ${product.text}
    Capture Page Screenshot    ${TEST NAME}.png
    Close Browser