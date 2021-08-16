*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${url}              https://training-wheels-protocol.herokuapp.com/
${browser}          chrome


*** Keywords ***
New Section
    Open Browser                    ${url}                  ${browser}
    Maximize Browser Window

Close Section
    Sleep       3
    Capture Page Screenshot
    Close Browser