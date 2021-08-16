*** Settings ***
Resource            base.robot

Test Setup          New Section
Test Teardown       Close Section

*** Variables ***
${ByID}        id:thor
${ByCSS}       css:input[value='iron-man']
${ByXpath}     xpath://*[@id='checkboxes']/input[7]
${suffix}      /checkboxes

*** Test Cases ***
Should Check Option Using Id 
    Go To                           ${url}${suffix}
    Select checkbox                 ${ByID}
    Checkbox Should Be Selected     ${ByID}


Should Check Option using CSS Selector
    Go To                           ${url}${suffix}
    Select checkbox                 ${ByCSS}
    Checkbox Should Be Selected     ${ByCSS}


Should Check Option using Xpath
    Go To                           ${url}${suffix}
    Select checkbox                 ${ByXpath}
    Checkbox Should Be Selected     ${ByXpath}


