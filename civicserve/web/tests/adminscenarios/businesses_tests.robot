
*** Settings ***
Documentation     Test scenarios to perform actions on businesses page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot
Resource    ../../../page_objects/admin_module/businesses_page.robot

*** Test Cases ***

Create a Business
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Create a Business
    Businesses: Fill the Business Details       ${tnewbuss_name}

Validate Created Business in Admin Portal
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search a Business      ${tnewbuss_name}
    Business: Validate presence of Business      ${tnewbuss_name}

Edit Existing Business
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search a Business      ${tnewbuss_name}
    Business: Go through the pages for specific business        ${tnewbuss_name}
    Businesses: Edit Created Business
    Businesses: Fill the Business Details       ${teditbuss_name}

Validate Edited Business in Admin Portal
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search a Business      ${teditbuss_name}
    Business: Validate presence of Business      ${teditbuss_name}

Delete a Business
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search a Business      ${teditbuss_name}
    Business: Go through the pages for specific business        ${teditbuss_name}
    Businesses: Delete a Business

Validate Business Deletion in Admin Portal
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search a Business      ${teditbuss_name}
    Business: Validate deletion of Business      ${teditbuss_name}
