*** Settings ***
Documentation     Test scenarios to perform actions on projects page

Suite Setup     TestData: Create Project Name       ${tproj_name}

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../page_objects/test_setup.robot

*** Test Cases ***

Scenario: Create a Project by admin
    [Tags]    Projects

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin adds a new Project       ${tincentive_program}       ${tappl_parcel_id1}      ${tproj_district}

Scenario: Validate Project created by Admin in Applicant Portal
    [Tags]    Projects

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    UserHome: Validate Presence of a Project        ${tproj_name}       ${tincentive_program}


Scenario: Edit Project by admin
    [Tags]    Projects

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
    Project: Admin Edits developer information
    Project: Admin Edits Property Info
    Project: Admin Edits eligible costs
#    Project: Admin Edits financing details  --getting issue after clicking on financial details edit button getting blank page after edit popup is opened
    Project: Admin Edits projections
    Project: Admin Edits estimated timeline
    Project: Admin Edits parties
    Project: Admin Edits Documentation Collection

Scenario: Validate Edited project details by Admin in Applicant Portal
    [Tags]    Projects

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    UserHome: Navigate to Resume application
#    ApplicationPage: Move from prop info to Next step without Any Action
#    ApplicationPage: Move from dev info to Next step without Any Action
#    ApplicationPage: Fill Proposed Project Info Details
#    ApplicationPage: Move from eligible costs to Next step without Any Action
#    ApplicationPage: Move to Next step without Any Action
#    ApplicationPage: Move from projections to Next step without Any Action
#    ApplicationPage: Move from estimated timeline to Next step without Any Action
    ApplicationPage: Move to Next step without Any Action
    ApplicationPage: Fill Declarations
    ApplicationPage: Validate Applicant Info In Summary Details
    ApplicationPage: Validate Property Info In Summary Details
#    ApplicationPage: Validate Proposed Project Info Details   #issue with this step
    ApplicationPage: Validate Eligible Costs Info Details
#    ApplicationPage: Validate Financing Details    -- no data due to financing details issue
    ApplicationPage: Validate Estimated Timeline
    ApplicationPage: Validate Projections
    ApplicationPage: Validate Parties
    ApplicationPage: Validate Document Collection
    ApplicationPage: Validate Declarations
    ApplicationPage: Perform Signature And Submit
    UserHome: Navigation to Home Page
    UserHome: Search a Project        ${tproj_name}
    UserHome: Validate Presence of a Project     ${tproj_name}       ${tincentive_program}

Scenario: Send messages from Correspondence tab of Project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
#    Gmail: Delete Mails in inbox        ${tgmail}        ${tpswd}
    Project: Admin sends message from correspondence tab
#    Gmail: Read mail in inbox       ${tgmail}       ${tpswd}        ${expected_sub1}     ${expected_body1}
#    Gmail: Delete Mails in inbox       ${tgmail}       ${tpswd}
    Project: Admin sends custom email from correspondence tab
#    Gmail: Read mail in inbox       ${tgmail}       ${tpswd}        ${tsubject}     ${tcorr_body}


Scenario: Approve a project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
    Project: Admin approves a Project

Scenario: Validate approved application status in applicant portal
    [Tags]    Projects

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    ApplicationPage: Validate application status    'Approved Project'    ${tproj_name}

Scenario: Upload and Edit Agreement Document of Project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
    Project: Admin Navigates to Agreement Document
    Project: Admin Uploads Agreement Document       ${agrmt_fileloc}        ${tagreement_doc_name}
    Project: Admin Uploads Agreement Document       ${agrmt_fileloc1}        ${tagreement_doc_name1}
    Project: Admin Edits Agreement Document

Scenario: Validate agreement document details in applicant portal
    [Tags]    Projects
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    UserHome: Go to submitted application
    SubmittedApplicationPage: Validate Agreement document details submitted

Scenario: Upload Approve Reject And Download Files of Project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
    Project: Admin Navigates to Files tab
    Project: Admin Uploads File Document        ${tupload_file_type_applicant}     ${file_tab_appl_fileloc}     ${tfile_appl_doc_name}
    Project: Admin Uploads File Document        ${tupload_file_type1_staff}     ${file_tab_fileloc}     ${tfile_doc_name}
    Project: Admin Uploads File Document        ${tupload_file_type2_thirdparty}        ${file_tab_fileloc1}        ${tfile_doc_name1}
    Project: Admin Approve Uploaded File Document      ${tfile_appl_doc_name}
    Project: Admin Reject Uploaded File Document        ${tfile_doc_name1}
    Project: Admin Downloads File Document

Scenario: Validate applicant file uploaded by admin in applicant portal
    [Tags]    Projects
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    UserHome: Go to submitted application
    SubmittedApplicationPage: Validate Files details submitted

Scenario: Add and Edit Agreement obligation of Project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
    Project: Admin Adds Agreement Obligation
    Project: Admin activates added agreement obligation         ${tadd_agreement_title}
    Project: Admin Edits Agreement Obligation

Scenario: Validate added agreement obligation details in applicant portal
    [Tags]    Projects
    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    UserHome: Go to submitted application
    SubmittedApplicationPage: Validate Agreement obligation details submitted

Scenario: Create and Deny a project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin adds a new Project       ${tincentive_program1}      ${tappl_parcel_id}      ${tdistrict_name1}
    Project: Admin denies a Project

Scenario: Validate Denied application status in applicant portal
    [Tags]    Projects

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tadmin_proj_name}
    ApplicationPage: Validate application status    'Denied Application'    ${tadmin_proj_name}

Scenario: Delete Denied project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project    ${tadmin_proj_name}
    Project: Delete a Project       ${tadmin_proj_name}     ${tproj_buss}


Scenario: Read Project Info by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details  ${tproj_name_comp}       ${tproj_buss}
    Project: Admin Reads Project Information
    Project: Admin Reads Project Details
    Project: Admin Reads property information
    Project: Admin Reads developer information
    Project: Admin Reads eligible costs
    Project: Admin Reads financing details
    Project: Admin Reads estimated timeline
    Project: Admin Reads projections
    Project: Admin Reads parties
    Project: Admin Reads Document Colleciton
    Project: Admin Reads Agreement
    Project: Admin Reads Files
#    Project: Admin Reads Compliance    --needs to modify test data
#    Project: Admin Reads Correspondence        --needs to modify test data


Scenario: Read Data from Db for Correspondence tab notes section
    [Tags]    Projects
    [Setup]     DB: Connect DB
    DB: Read Data from Db for Correspondence tab notes section  ${tproj_name_comp}
    [Teardown]      DB: Disconnect DB

Scenario: Validate Audit data from UI and db by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details      ${tproj_name_comp}       ${tproj_buss}
    @{output}=       Project: Create Audit Data
    DB: Connect DB
    @{dboutput}=      DB: Read Data from Db for Audit tab  ${tproj_name_comp}
    DB: Disconnect DB
    Lists Should Be Equal    ${output}    ${dboutput}

Scenario: Delete Agreement File And Project by admin
    [Tags]    Projects
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project and navigates to Project details    ${tproj_name_comp}       ${tproj_buss}
    Project: Admin Deletes Agreement Obligation
    Project: Admin Deletes Agreement Document
#    Project: Admin Deletes File Document    --- no delete present for files documents as of now when approevd or rejected
    AdminHome: Admin on All Projects
    Project: Admin Searches for a Project    ${tproj_name_comp}
    Project: Delete a Project       ${tproj_name_comp}       ${tproj_buss}

Scenario: Validate deleted Project by admin in applicant portal
    [Tags]    Projects

    User: Public User on CivicServe Site     ${test_dev_username}        ${test_dev_password}        ${test_exp_profile_name}
    UserHome: Search a Project        ${tproj_name}
    UserHome: Validate Deletion of a Project     ${tproj_name}       ${tincentive_program}







