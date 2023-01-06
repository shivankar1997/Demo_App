*** Settings ***
Library     SeleniumLibrary
Test Setup     open browser    http://localhost:8081       chrome
Test Teardown      close all browsers

*** Variables ***
${username}=     root
${password}=     123
${firstname}=       john
${familyname}=      wick
${phone}=   xyz

*** Keywords ***
User-Register
        [Tags]  Register
        sleep       2s
        click element   xpath://a[contains(text(),'Register')]
        sleep   1s
        input text  id:username         ${username}
        input text  id:password         ${password}
        input text  id:firstname         ${firstname}
        input text  id:lastname         ${familyname}
        input text  id:phone         ${phone}
        click element   xpath://input[@value='Register' and @type='submit']
        sleep   2s
        element should not be visible     xpath://input[@value='Register' and @type='submit']


User-Login
        [Tags]  Login
        click element   xpath://a[contains(text(),'Log In')]
        sleep       1s
        input text  id:username         ${username}
        input text  id:password         ${password}
        click element   xpath://input[@value='Log In' and @type='submit']
        sleep       1s
        element should not be visible     xpath://input[@value='Log In' and @type='submit']
        ${username}=   Get table cell      id:content  2   2
        ${firstname}=   Get table cell      id:content  3   2
        ${familyname}=   Get table cell      id:content  4   2
        ${phone}=   Get table cell      id:content  5   2
        log to console  ${username}
        log to console  ${firstname}
        log to console  ${familyname}
        log to console  ${phone}

*** Test Cases ***
Tc-User-Register
    User-Register

Tc-User-Login
    User-Login