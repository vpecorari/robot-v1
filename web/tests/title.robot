*** Settings ***
Resource            base.robot

Test Setup          New Section
Test Teardown       Close Section

*** Test Cases ***
Should Return Page Title
    Title Should Be     Training Wheels Protocol

