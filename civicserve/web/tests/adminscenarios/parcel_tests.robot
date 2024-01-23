*** Settings ***
Documentation     Test scenarios to perform actions on districts zones and parcels page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot

*** Test Cases ***

Scenario: Create a Parcel
    [Tags]    Parcels

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Scroll to Parcels Header
    Parcels: Click Create New Parcel
    Parcels: Fill in Details to Create Parcels      ${tparcel_id_input}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Scroll to Parcels Header
    Parcels: Search for a Parcel        ${tparcel_id_input}
    Parcels:Validate presence of Parcel     ${tparcel_id_input}

Scneario: Assign a Parcel and Program to District
    [Tags]    Parcels
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Go through pages for a district        ${tdis_name}
    District: Click Edit District        ${tdis_name}
    District: Search a program in districts page      ${tsearch_selected_programs_input}
    District: Assign district to a program if not asssigned      ${tsearch_selected_programs_input}
    District: Search a parcel in districts page        ${tparcel_id_input}
    District: Assign parcel to District        ${tparcel_id_input}

Scenario: Validate parcel assigend to a Program in Applicant Portal
    [Tags]    Applicant

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: User on New Application Page      ${tappl_prog_name}
    ApplicationPage: Skip Step1
    ApplicationPage: Enter Project Description
    ApplicationPage: Fill Developer Info Details
    ApplicationPage: Fill Property Info Details     ${tparcel_id_input}



Scenario: Delete Project with Parcel by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project    ${tappl_proj_name}
    Project: Delete a Project       ${tappl_proj_name}

Scenario: Edit existing Parcel
    [Tags]    Parcels

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Scroll to Parcels Header
    Parcels: Search for a Parcel        ${tparcel_id_input}
    Parcels: Click Edit Parcel      ${tparcel_id_input}
    Parcels: Fill in Details to Edit Parcel      ${teditparcel_id_input}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Scroll to Parcels Header
    Parcels: Search for a Parcel        ${teditparcel_id_input}
    Parcels:Validate presence of Parcel     ${teditparcel_id_input}

Scenario: Validate edited parcel assigned to a Program in Applicant Portal
    [Tags]    Applicant

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: User on New Application Page      ${tappl_prog_name}
    ApplicationPage: Skip Step1
    ApplicationPage: Enter Project Description
    ApplicationPage: Fill Developer Info Details
    ApplicationPage: Fill Property Info Details     ${teditparcel_id_input}

Scenario: Delete Project with edited assigned parcel by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project    ${tappl_proj_name}
    Project: Delete a Project       ${tappl_proj_name}

Scneario: Unassign Parcel to District
    [Tags]    Parcels
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Go through pages for a district        ${tdis_name}
    District: Click Edit District        ${tdis_name}
    District: Search a parcel in districts page        ${teditparcel_id_input}
    District: Unassign parcel to District        ${teditparcel_id_input}

Scenario: Delete existing Parcel
    [Tags]    Parcels

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on Districts Zones And Parcels Page
    Parcels: Scroll to Parcels Header
    Parcels: Search for a Parcel        ${teditparcel_id_input}
    Parcels: Click Delete Parcel      ${teditparcel_id_input}
    Parcels: Search for a Parcel        ${teditparcel_id_input}
    Parcels:Validate deletion of Parcel     ${teditparcel_id_input}

Scenario: Validate deleted parcel assigned to a Program in Applicant Portal
    [Tags]    Applicant

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: User on Programs Page
    UserHome: User on New Application Page      ${tappl_prog_name}
    ApplicationPage: Skip Step1
    ApplicationPage: Enter Project Description
    ApplicationPage: Fill Developer Info Details
    ApplicationPage: Validate deleted parcel Details     ${teditparcel_id_input}
