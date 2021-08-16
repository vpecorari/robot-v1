*** Settings ***
Resource                base.robot

Test Setup              New Section
Test Teardown           Close Section

*** Variables ***
${RadioGroupName}       movies
${ByID}                 cap
${ByValue}              the-avengers
${suffix}               /radios

*** Test Cases ***
Should Select Option Using Id 
    Go To                           ${url}${suffix}
    Select Radio Button             ${RadioGroupName}       ${ByID}
    Radio Button Should Be Set To   ${RadioGroupName}       ${ByID}

Should Check Option using Value
    Go To                           ${url}${suffix}
    Select Radio Button             ${RadioGroupName}       ${ByValue}
    Radio Button Should be Set To   ${RadioGroupName}       ${ByValue} 



