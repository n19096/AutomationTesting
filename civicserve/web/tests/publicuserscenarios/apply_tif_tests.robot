*** Settings ***
Documentation     Test scenarios to perform actions on applicant portal

Suite Setup     TestData: Create Project Name       ${tadmin_proj_name}

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot

*** Test Cases ***

Scenario: Apply for TIF Program
    [Tags]    Applicant

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: User on New Application Page      ${tappl_prog_name}
    ApplicationPage: Skip Step1
    ApplicationPage: Enter Project Description
    ApplicationPage: Fill Property Info Details     ${tappl_parcel_id}
    ApplicationPage: Fill Developer Info Details
    ApplicationPage: Fill Proposed Project Info Details     ${tadmin_proj_name}
    ApplicationPage: Fill Eligible Costs Details
    ApplicationPage: Fill Financing details
    ApplicationPage: Fill Projections
    ApplicationPage: Fill estimated timeline
    ApplicationPage: Fill Parties details
    ApplicationPage: Fill Documentation Collection
    ApplicationPage: Fill Declarations
    ApplicationPage: Validate Applicant Info In Summary Details
    ApplicationPage: Validate Property Info In Summary Details
#    ApplicationPage: Validate Proposed Project Info Details
    ApplicationPage: Validate Eligible Costs Info Details
    ApplicationPage: Validate Financing Details
    ApplicationPage: Validate Estimated Timeline
    ApplicationPage: Validate Projections
    ApplicationPage: Validate Parties
    ApplicationPage: Validate Document Collection
    ApplicationPage: Validate Declarations
    ApplicationPage: Perform Signature And Submit
    UserHome: Navigation to Home Page
    UserHome: Search a Project  ${tadmin_proj_name}
    UserHome: Validate Presence of a Project  ${tadmin_proj_name}       ${tappl_prog_name}
#    UserHome: Navigate through pages to validate presence of project  ${tadmin_proj_name}

Scenario: Read Project Info of application by admin through programs page
    [Tags]    Projects

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Incentive TIF Program
    TIFDashboard: Navigate to Projects from TIF Program dashbaord
    TIFProjects: Navigate through pages to validate presence of project  ${tproj_name_comp}



Scenario: Read Project Info of application by admin
    [Tags]    Projects

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}              ${tdev_info_buss_option}
    Project: Admin Reads Application Project Information
    Project: Admin Reads Application Project Details
    Project: Admin Reads property information
    Project: Admin Reads developer information
    Project: Admin Reads eligible costs
    Project: Admin Reads financing details
    Project: Admin Reads estimated timeline
    Project: Admin Reads projections
    Project: Admin Reads parties
    Project: Admin Reads Document Colleciton
    Project: Admin Reads Declarations

Scenario: Delete Project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project    ${tadmin_proj_name}
    Project: Delete a Project       ${tproj_name_comp}        ${tdev_info_buss_option}

Scenario: Validate deleted Project by admin in applicant portal
    [Tags]    Projects

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Navigate through pages to validate deletion of project        ${tadmin_proj_name}