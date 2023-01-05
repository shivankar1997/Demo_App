*** Settings ***
Library  SSHLibrary

*** Test Cases ***
tc-test-ssh
    Open Connection    192.168.119
    Login    navneet   Shivankar2000
    ${result}=    Execute Command    pwd
    get directory       /home/navneet/Pictures/munsyari
    close connection
    log      ${result}