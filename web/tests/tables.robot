*** Settings ***
Resource            base.robot

Test Setup          New Section
Test Teardown       Close Section

*** Variables ***
${ActorsRowID}          id:actors
${TableLineValue}       1
${InstagramByValue}     @robertdowneyjr
${SalaryRowValue}       $ 10.000.000
${ActorsNameValue}      Robert Downey Jr
${suffix}               /tables

*** Test Cases ***
Should Verify a Value Row from the Table 
    Go To                           ${url}${suffix}
    Table Row Should Contain        ${ActorsRowID}               ${TableLineValue}           	${InstagramByValue}


Locate the Table Line by Key Value and validate the remain values from the same line
    Go To                           ${url}${suffix}
    ${target}=                      Get WebElement              xpath:.//tr[contains(., '${InstagramByValue}')]
    Log                             ${target.text}
    Should Contain                  ${target.text}              ${SalaryRowValue}
    Should Contain                  ${target.text}              ${ActorsNameValue}