*** Settings ***
Documentation     Login Test scenarios

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../page_objects/test_setup.robot

*** Test Cases ***

 Scenario: Login with Valid Admin Credentials
     [Tags]    smoke
     Admin: User on CivicServe Admin Site     ${TEST NAME}    Login

Scenario: Login with Valid Public User Credentials
    [Tags]    smoke
    User: Public User on CivicServe Site     ${TEST NAME}   Login

Scenario: Login with invalid User Credentials
     [Tags]    smoke
    User: User on Invalid Credentials Message Page      ${TEST NAME}    Login