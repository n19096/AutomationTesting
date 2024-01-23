*** Settings ***
Documentation     Test scenarios to perform actions on templates page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot

*** Test Cases ***

Scenario: Create a template
    [Tags]    Template
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Templates
    Template: Create a new Template

Scenario: Edit a template
    [Tags]    Template
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Templates
    Template: Search a template     ${ttemp_name}
    Template: Go through the pages for specific template    ${ttemp_name}
    Template: Edit an existing Template

Scenario: Delete a template
    [Tags]    Template
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Templates
    Template: Search a template     ${tedit_temp_name}
    Template: Go through the pages for specific template    ${tedit_temp_name}
    Template: Delete an existing Template
