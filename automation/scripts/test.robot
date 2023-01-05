*** Settings ***
Library     SeleniumLibrary
Library    DataDriver   data.csv
Test Template   vd-001

#Test Setup     open browser    https://youtu.be/jkE8WjryDOs       chrome
Test Teardown      close all browsers

*** Variables ***
#${username}=     root12345
#${password}=     123
#${firstname}=       john
#${familyname}=      wick
#${phone}=   xyz

*** Keywords ***
vd-001
    [Arguments]     ${username}     ${password}
    open browser    https://youtu.be/jkE8WjryDOs       safari
    sleep   10s
#    click element  xpath://*[@id="movie_player"]/div[27]/div[2]/div[1]/button
#    sleep   10s
#    FOR    ${index}    IN RANGE    1    25
#    Execute Javascript    window.open('https://youtu.be/jkE8WjryDOs')
#    sleep   5s
#    wait until page contains  //*[@id="buttons"]//div[@class="yt-spec-touch-feedback-shape__fill"]
    click element  //*[@id="buttons"]/ytd-button-renderer/yt-button-shape/a/yt-touch-feedback-shape/div/div[2]
#    wait until page contains    //input[@id="identifierId"]
    sleep   5s
    input text  //input[@id="identifierId"]     ${username}
    click element  //*[@id="identifierNext"]
#    wait until page contains    //*[@id="password"]
    sleep   5s
    input text  //*[@id="password"]     ${password}
    click element  //span[contains(text(),'Next')]
#    wait until page contains
#    wait until page contains  //span[contains(text(),'Not now')]
    sleep   5s
    click element  //span[contains(text(),'Not now')]
#    END
    sleep   501s
    close all browsers

*** Test Cases ***
${username}     ${password}
#Tc-User-Login
#    FOR    ${iteration}    IN RANGE    1    3000
#        vd-001
#    END
