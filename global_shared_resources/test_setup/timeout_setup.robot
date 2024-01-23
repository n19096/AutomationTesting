*** Settings ***
Documentation    This page contains keywords related to timeout setup.
Resource    library_setup.robot


*** Variables ***
${wait_time}      60
${short_wait_time}    30
${long_wait_time}    120

*** Keywords ***
Set Wait Time Based On Test Environment
    [Documentation]    Sets Time out based on the environment
    
    Set Global Variable    ${wait_time}    ${wait_time}
    Set Selenium Timeout    ${wait_time}
	Log To Console    Wait time for this session: ${wait_time} seconds