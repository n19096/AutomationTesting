*** Settings ***
Documentation     Test scenarios to perform actions on Agreement compliances page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot
Resource    ../../../page_objects/admin_module/compliances_page.robot

*** Test Cases ***

Create Agreement Compliance
    [Tags]    Compliance
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin On Compliances Dashboard Page
    Compliance Dashboard: Go to Compliance Page
    Compliance: Create a Global Compliance

Edit Existing Compliance
    [Tags]    Compliance
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin On Compliances Dashboard Page
    Compliance Dashboard: Go to Compliance Page
    Compliance: Search a Global Compliance      ${tglob_agreement_title}
    Compliance: Edit a Global Compliance

Delete Existing Compliance
    [Tags]    Compliance
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin On Compliances Dashboard Page
    Compliance Dashboard: Go to Compliance Page
    Compliance: Search a Global Compliance      ${tglob_edit_agreement_title}
    Compliance: Delete a Global Compliance


