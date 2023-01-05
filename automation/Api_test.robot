*** Settings ***
Library     RequestsLibrary
Library     Collections
Test Setup      Auth_Test

*** Variables ***
${base_url}=    http://localhost:8081
@{auth_cred}   root   12345


*** Keywords ***
Auth_Test
    ${header}     create dictionary    Content-Type=application/json
    create session   mysession      ${base_url}  auth=${auth_cred}
    ${response}=    get request    mysession    /api/auth/token    headers=${header}
    ${status_code}=     convert to string    ${response.status_code}
    ${content}=     convert to string    ${response.content}
    ${token}=     catenate  Bearer${SPACE}  ${content}[29:-3]
    should contain    ${status_code}    200
    log   ${token}
    Set Global Variable     ${token}

Review_Users
    [Tags]  user
    ${header}     create dictionary    Authorization=${token}    Content-Type=application/json
    create session   mysession      ${base_url}
    ${response}=    get request    mysession    /api/users    headers=${header}
    ${status_code}=     convert to string    ${response.status_code}
    ${res_content}=     convert to string    ${response.content}
    should contain    ${status_code}    200

*** Test Cases ***
Api-test-review-user
    Review_Users
