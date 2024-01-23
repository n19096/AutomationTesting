*** Settings ***
Documentation     Test scenarios to perform actions on program managements page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot

*** Test Cases ***

Scenario: Create a program through Program Management Page
    [Tags]    Program
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Program Management
    ProgramManagement: Admin Creates New Program

Scenario: Validate created program in applicant portal
    [Tags]    Applicant
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: Validate no program      ${ttif_program_name}


Scenario: Edit a program through Program Management Page
    [Tags]    Program
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Program Management
    ProgramManagement: Admin edits newly created Program
    ProgramManagement: Admin adds General Information to Program
    ProgramManagement: Admin adds Policies to Program      ${tpolicy_name1}      ${tpolicy_desc1}
    ProgramManagement: Admin adds application steps to Program      ${tapplication_step_name12}
    ProgramManagement: Admin edits Applicant Info to Program
    ProgramManagement: Admin adds funding sources to Program
    ProgramManagement: Admin adds eligible costs to Program
    ProgramManagement: Admin adds eligible construction activity to Program
    ProgramManagement: Admin adds required party info to Program
    ProgramManagement: Admin assigns districts to Program
    ProgramManagement: Admin adds data classifications to Program

Scenario: Validate Policy and application step names added in applicant portal
    [Tags]    Applicant
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: User on New Application Page      ${ttif_program_name}
    ApplicationPage: Validate policy name
    ApplicationPage: Validate application step name

Scenario: Delete a program through Program Management Page
    [Tags]    Program
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on Program Management
    ProgramManagement: Admin deletes Program

Scenario: Validate deleted program in applicant portal
    [Tags]    Applicant
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: Validate no program      ${ttif_program_name}


