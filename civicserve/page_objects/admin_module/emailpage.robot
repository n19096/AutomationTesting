*** Settings ***
Documentation    This file contians page objects for email page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/test_setup/browser_setup.robot
Library                 ImapLibrary2
Library     re

*** Variables ***

${url regexp}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+

*** Keywords ***

Gmail: Read mail in inbox
    [Documentation]    Reads the subject and body of a mail in inbox.
    [Arguments]     ${gmail}        ${pswd}     ${expected_sub}     ${expected_body}

    Open Mailbox    server=imap.googlemail.com     user=${gmail}     password=${pswd}
    ${LATEST} =    Wait For Email    sender=no-reply@civicserve.com    timeout=300
    Walk Multipart Email    ${LATEST}
    ${sub} =  Get Multipart Field  Subject
    ${HTML} =       Get Email Body    ${LATEST}
    ${Parser_Body}=  Remove String Using Regexp    ${HTML}    (<.*?>)    #remove tags
    Should Contain    ${sub}    ${expected_sub}
    Should Contain    ${Parser_Body}    ${expected_body}
    Close Mailbox

Gmail: Read mail and open link
    [Documentation]    Reads the subject and body of a mail in inbox.
    [Arguments]     ${gmail}        ${pswd}     ${expected_sub}     ${expected_body}

    Open Mailbox    server=imap.googlemail.com     user=${gmail}     password=${pswd}
    ${LATEST} =    Wait For Email    sender=no-reply@civicserve.com    timeout=300
    Walk Multipart Email    ${LATEST}
    ${sub} =  Get Multipart Field  Subject
    ${HTML} =       Get Email Body    ${LATEST}
    ${Parser_Body}=  Remove String Using Regexp    ${HTML}    (<.*?>)    #remove tags
    Should Contain    ${sub}    ${expected_sub}
    Should Contain    ${Parser_Body}    ${expected_body}
    @{lines}=    re.findall    ${url regexp}    ${HTML}
    ${url}=  Remove String Using Regexp    ${lines}[2]    (')
#    Log To Console    ${url}
#    Log Many    @{lines}
#    ${ALL_LINKS}    Get Links from Email    ${LATEST}
    Close Browser
#    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
#    Call Method    ${options}    add_argument    incognito
#    Create WebDriver    Chrome    gc
#    chrome_options=${options}
#    Go To    ${lines}[2]
    Open Browser        ${url}     gc
    Close Mailbox

Gmail: Delete Mails in inbox
    [Arguments]     ${gmail}        ${pswd}
    Open Mailbox    server=imap.googlemail.com     user=${gmail}     password=${pswd}
#    Wait For Email    sender=no-reply@civicserve.com    timeout=300
    Delete All Emails


Gmail: Validate mail not in inbox
    [Documentation]    Reads the subject and body of a mail in inbox.
    [Arguments]     ${gmail}        ${pswd}     ${expected_sub}     ${expected_body}

    Open Mailbox    server=imap.googlemail.com     user=${gmail}     password=${pswd}
    ${LATEST} =    Wait For Email    sender=no-reply@civicserve.com    timeout=300
    Walk Multipart Email    ${LATEST}
    ${sub} =  Get Multipart Field  Subject
    ${HTML} =       Get Email Body    ${LATEST}
    ${Parser_Body}=  Remove String Using Regexp    ${HTML}    (<.*?>)    #remove tags
    Should Not Contain    ${sub}    ${expected_sub}
    Should Not Contain    ${Parser_Body}    ${expected_body}
    Close Mailbox
