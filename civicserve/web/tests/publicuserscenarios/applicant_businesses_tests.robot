*** Settings ***
Documentation     Test scenarios to perform actions on applicant businesses page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot
Resource    ../../../page_objects/publicuser_module/publicuser_businesses_page.robot
Resource    ../../../page_objects/admin_module/businesses_page.robot

*** Test Cases ***

Create an Applicant Business
    [Tags]    Business

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Go to Create a Business
    Applicant Businesses: Fill the applicant Business Details       ${tappl_newbuss_name}
    UserHome: Navigate through pages to validate presence of business       ${tappl_newbuss_name}

Validate Business in Admin Portal
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search applicant Business      ${tappl_newbuss_name}
    Business: Validate presence of Business      ${tappl_newbuss_name}


Edit Existing Applicant Business
    [Tags]    Business
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    Applicant Business: Go through the pages for specific business        ${tappl_newbuss_name}
    Applicant Businesses: Edit Applicant Created Business
    Applicant Businesses: Fill the Applicant Business Details       ${teditappl_buss_name}
    UserHome: Navigate through pages to validate presence of business       ${teditappl_buss_name}

Validate Edited Business in Admin Portal
    [Tags]    Business
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Businesses
    Businesses: Search applicant Business      ${teditappl_buss_name}
    Business: Validate presence of Business      ${teditappl_buss_name}

Delete Applicant Business
    [Tags]    Business
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    Applicant Business: Go through the pages for specific business        ${teditappl_buss_name}
    Applicant Businesses: Delete applicant Business
    UserHome: Navigate to businesses pagenumber     1
    UserHome: Navigate through pages to validate deletion of business       ${teditappl_buss_name}

#Validate Business Deletion in Admin Portal
#    [Tags]    Business
#    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
#    AdminHome: Admin on Businesses
#    Businesses: Search a Business      ${teditappl_buss_name}
#    Business: Validate deletion of Business      ${teditappl_buss_name}