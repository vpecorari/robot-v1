*** Settings ***
Resource            base.robot

Test Setup          New Section
Test Teardown       Close Section

*** Variables ***
${suffix}                     /login

${CorrectUsername}            stark
${CorrectPassword}            jarvis!
${ExpectedFullName}           Tony Stark
${IncorrectUsername}          stark1
${IncorrectPassword}          stark1



*** Keywords ***
Login with
    [Arguments]         ${LoginUser}                    ${LoginPassword}

    Input Text          css:input[name=username]        ${LoginUser} 
    Input Text          css:input[name=password]        ${LoginPassword}
    Click Element       class:btn-login

Should See Logged User
    [Arguments]             ${user_fullname}
    Page Should Contain     Olá, ${user_fullname}. Você acessou a área logada!


Should Contain Login Alert
    [Arguments]         ${expected_message}

    ${message}=         Get WebElement          id:flash
    Should Contain      ${message.text}         ${expected_message}





*** Test Cases ***
Login with Success - Correct credentials
    [tags]              login_Success
    Go To               ${url}${suffix}
    Login with          ${CorrectUsername}     ${CorrectPassword}  

    Should See Logged User  ${ExpectedFullName}

Login with Wrong Password
    [tags]              login_PassowrdError
    Go To               ${url}${suffix}
    Login with          ${CorrectUsername}      ${IncorrectPassword}
    
    Should Contain Login Alert      Senha é invalida!


Login with Wrong User
    [tags]              login_UsernameError
    Go To               ${url}${suffix}
    Login with          ${IncorrectUsername}     ${IncorrectPassword}
    
    Should Contain Login Alert  O usuário informado não está cadastrado!
