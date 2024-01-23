*** Settings ***
Documentation     Test scenarios to perform actions on notifications page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot
Resource    ../../../page_objects/admin_module/settings_page.robot

*** Test Cases ***


Scenario: Create a notification
    [Tags]    Notification

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Notifications Page
    Notifications: Create New Notification
    Notifications: Change the notifications page size to hundred
    Notifications: Validate Created Notification        ${tnotification_event_type_option}

Scenario: Invite a User through User Management Page
    [Tags]    Notification

    Gmail: Delete Mails in inbox        ${tgmail1}       ${tpswd1}
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Click Invite New Public User
    UserManagement: Fill User Details to invite user                ${tuserfirstname_input1}     ${tuserlastname_input1}     ${temail_input1}  ${tphone_no_input1}
    UserManagement: Select Account Type for public user
    UserManagement: Click Invite Button

#Scenario: Submit TIF Program
#    [Tags]    Notification1
#
#    Gmail: Delete Mails in inbox        ${tgmail2}       ${tpswd2}
#    User: Public User on CivicServe Site     ${test_dev_username1}        ${test_dev_password1}        ${test_exp_profile_name1}
#    UserHome: User on Programs Page
#    UserHome: User on New Application Page      ${tprogram_name}
#    ApplicationPage: Skip Step1
#    ApplicationPage: Enter Project Description
#    ApplicationPage: Fill Property Info Details     ${tappl_parcel_id1}
#    ApplicationPage: Fill Developer Info Details
#    ApplicationPage: Fill Proposed Project Info Details
#    ApplicationPage: Fill Eligible Costs Details
#    ApplicationPage: Fill Financing details
#    ApplicationPage: Fill Projections
#    ApplicationPage: Fill estimated timeline
#    ApplicationPage: Fill Parties details
#    ApplicationPage: Fill Documentation Collection
#    ApplicationPage: Fill Declarations
#    ApplicationPage: Perform Signature And Submit
##    UserHome: Navigation to Home Page
##    UserHome: Navigate through pages to validate presence of project  ${tappl_proj_name1}

Scenario: Validate the created notification email triggered
    [Tags]    Notification

    [Setup]     None
    Gmail: Read mail in inbox       ${tgmail}       ${tpswd}        ${temail_template_sub}     ${temail_template_body}
    [Teardown]      None

Scenario: Edit existing Notification
    [Tags]    Notification

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Notifications Page
    Notifications: Change the notifications page size to hundred
    Notifications: Edit Existing Notification
    Notifications: Change the notifications page size to hundred
    Notifications: Validate Created Notification        ${tnotification_event_type_option1}

Scenario: Project Status Change to Approved by admin
    [Tags]    Notification

    Gmail: Delete Mails in inbox        ${tgmail}       ${tpswd}
    Admin: User on CivicServe Admin Site     ${test_admin_username1}        ${test_admin_password}        ${test_exp_admin_profile_name1}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tappl_proj_name2}
    Project: Admin approves a Project


Scenario: Validate the edited notification email triggered
    [Tags]    Notification

    [Setup]     None
    Gmail: Read mail in inbox       ${tgmail}       ${tpswd}        ${tnot_sub_input}     ${tnot_body_input}
    [Teardown]      None



Scenario: Delete existing Notification
    [Tags]    Notification

    Admin: User on CivicServe Admin Site     ${test_admin_username1}        ${test_admin_password}        ${test_exp_admin_profile_name1}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name1}
    Settings: Admin on Notifications Page
    Notifications: Change the notifications page size to hundred
    Notifications: Delete Existing Notification    ${tnotification_event_type_option1}
    Notifications: Validate Deleted Notification        ${tnotification_event_type_option1}

Scenario: Another Project Status Change to denied by admin
    [Tags]    Notification

    Gmail: Delete Mails in inbox        ${tgmail2}       ${tpswd2}
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tappl_proj_name2}
    Project: Admin denies a Project

Scenario: Validate no email triggered
    [Tags]    Notification

    [Setup]     None
    Gmail: Validate mail not in inbox       ${tgmail}       ${tpswd}        ${tnot_sub_input}     ${tnot_body_input}
    [Teardown]      None

Scenario: Delete Project1 by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username1}        ${test_admin_password}        ${test_exp_admin_profile_name1}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project    ${tappl_proj_name2}
    Project: Delete a Project       ${tappl_proj_name2}


Scenario: Delete User by Admin
    [Tags]    Notification

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Navigate to Public User
    UserManagement: Search User     ${temail_input1}
    UserManagement: Delete User    ${temail_input1}
    DB: Connect DB
    DB: Delete Public User Data from Db     ${temail_input1}
    DB: Disconnect DB