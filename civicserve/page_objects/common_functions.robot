*** Settings ***
Documentation    This file contains common keywords which can be used accross the application.

*** Variables ***
${current_email_acct}    
${current_name_acct}

*** Keywords ***
Generate A New Random Email
    [Documentation]    Creates a new user email based on epoch time and sets the email to ${current_email_acct}.
    
    ${time}    Get Time    epoch
    ${random_nums}    Generate Random String    3    [NUMBERS]
    Set Test Variable   ${current_email_acct}    autotest${time}${random_nums}@test.com
    Set Test Variable   ${current_name_acct}     autotest${time}
    
Verify Timer is Decreasing
    [Documentation]    Verify the timer displayed for the specified element is decreasing.
    [Arguments]    ${element}
    
    ${timer}    Get Text    ${element}
    Sleep     2
    ${timer_after_sleep}    Get Text    ${element}
    ${timer_difference}    Subtract Time From Time    ${timer}    ${timer_after_sleep}    compact
    ${timer_difference}    Get Regexp Matches    ${timer_difference}    \\d+
    Run Keyword If    ${timer_difference}[0] > 1
    ...    Log    Timer is decreasing as expected
    ...    ELSE     Fail With Failure Details    Timer is not decreasing as expected

Get Text And Convert To Integer
    [Documentation]    Gets text from locator and returns integer value.
    [Arguments]    ${element}
    
    ${text}    Get Text    ${element}
    ${number}    Get Regexp Matches    ${text}    \\d+
    ${number}    Convert To Integer    ${number}[0]
    [Return]    ${number}
    

Verify Browser Back Navigation Is Disabled
    [Documentation]    Read URL, hit browser back navigation and verifies the url is same before and after hitting the browser back button
    
    ${expected_url}    Get Location
    Go Back
    ${actual_url}    Get Location
    Compare Two Values Are Equal    ${expected_url}    ${actual_url}  