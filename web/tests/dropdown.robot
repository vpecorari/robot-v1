*** Settings ***
Resource            base.robot

Test Setup          New Section
Test Teardown       Close Section

*** Variables ***
${ByLabel}       Scott Lang
${ByValue}       7
${suffix}        /dropdown

*** Test Cases ***
Should Select Option by Label and Validate by Value 
    Go To                           ${url}${suffix}
    Select From List By Label       class:avenger-list              ${ByLabel}
    ${selected}=                    Get Selected List Value         class:avenger-list
    Should Be Equal                 ${selected}                     ${ByValue}
    
Should Select Option by Valeu and Validate by Label 
    Go To                           ${url}${suffix}
    Select From List By Value       id:dropdown                     ${ByValue}
    ${selected}=                    Get Selected List Label         id:dropdown
    Should Be Equal                 ${selected}                     ${ByLabel}