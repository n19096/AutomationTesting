*** Settings ***
Documentation     Test scenarios to perform actions on KPI page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot
Resource    ../../../page_objects/admin_module/kpis_page.robot

*** Test Cases ***

Create KPI
    [Tags]    KPI
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on KeyPerformanceIndicators
    KPI Dashboard: Go to KPI Page
    KPI: Create a KPI

Edit Existing KPI
    [Tags]    KPI
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on KeyPerformanceIndicators
    KPI Dashboard: Go to KPI Page
    KPI: Search a KPI      ${tkpi_name}
    KPI: Edit a KPI

Delete Existing KPI
    [Tags]    KPI
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on KeyPerformanceIndicators
    KPI Dashboard: Go to KPI Page
    KPI: Search a KPI      ${tedit_kpi_name}
    KPI: Delete a KPI


