*** Settings ***
Documentation     Test scenarios to perform actions on user management page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot

*** Test Cases ***

Scenario: Invite a Government User through User Management Page
    [Tags]    User Management

    Gmail: Delete Mails in inbox        ${tgmail}       ${tpswd}
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Click Invite New Government User
    UserManagement: Fill User Details to invite user        ${tuserfirstname_input}     ${tuserlastname_input}     ${temail_input}  ${tphone_no_input}
    UserManagement: Fill Government Details to invite user
    UserManagement: Fill Address Details to invite user
    UserManagement: Click Invite Button

Scenario: Join as Government User from Invitation Mail
    [Tags]    User Management
    [Setup]     None
    Gmail: Read mail and open link       ${tgmail}       ${tpswd}        ${user_invitation_expected_sub}     ${user_invitation_expected_body}
    User: User On Reset Password Page     ${tnewpswd_input}

Scenario: Login Gov Admin User with password set by user
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${temail_input}        ${tnewpswd_input}        ${tuserlastname_input}

Scenario: Invite a Public User through User Management Page
    [Tags]    User Management

    Gmail: Delete Mails in inbox        ${tgmail1}       ${tpswd1}
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Click Invite New Public User
    UserManagement: Fill User Details to invite user                ${tuserfirstname_input1}     ${tuserlastname_input1}     ${temail_input1}  ${tphone_no_input1}
    UserManagement: Select Account Type for public user
    UserManagement: Click Invite Button

Scenario: Join as Public User from Invitation Mail
    [Tags]    User Management
    [Setup]     None
    Gmail: Read mail and open link       ${tgmail1}       ${tpswd1}        ${user_invitation_expected_sub}     ${user_invitation_expected_body}
    User: User On Reset Password Page     ${tnewpswd_input}

Scenario: Login Public User with password set by user
    [Tags]    User Management

    User: Public User on CivicServe Site     ${temail_input1}        ${tnewpswd_input}        ${tuserlastname_input1}

Scenario: Edit Government User Details through User Management Page
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Search User     ${temail_input}
    UserManagement: Click Edit Button     ${temail_input}
    UserManagement: Edit User Details       ${tedit_userfirstname_input}     ${tedit_userlastname_input}     ${tedit_email_input}  ${tedit_phone_no_input}
    UserManagement: Edit Government Details
    UserManagement: Edit Address Details
    UserManagement: Click On Update Button

Scenario: Edit Public User Details through User Management Page
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Navigate to Public User
    UserManagement: Search User     ${temail_input1}
    UserManagement: Click Edit Button     ${temail_input1}
    UserManagement: Edit User Details       ${tedit_userfirstname_input1}     ${tedit_userlastname_input1}     ${tedit_email_input1}  ${tedit_phone_no_input1}
    UserManagement: Edit Selected Account Type for public user
    UserManagement: Click On Update Button

Scenario: Send reset email link to Government User
    [Tags]    User Management

    Gmail: Delete Mails in inbox        ${tgmail}       ${tpswd}
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Search User     ${temail_input}
    UserManagement: Click Key Button     ${temail_input}
    UserManagement: Send Reset email link for user

Scenario: Reset password from reset mail by Government User
    [Tags]    User Management
    [Setup]     None
    Gmail: Read mail and open link       ${tgmail}       ${tpswd}        ${user_reset_expected_sub}     ${user_reset_expected_body}
    User: User On Reset Password Page     ${tnewpswd_input1}

Scenario: Login Gov Admin User with password reset by user
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${temail_input}        ${tnewpswd_input1}        ${tuserlastname_input}

Scenario: Send reset email link to Public User
    [Tags]    User Management

    Gmail: Delete Mails in inbox        ${tgmail1}       ${tpswd1}
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Navigate to Public User
    UserManagement: Search User     ${temail_input1}
    UserManagement: Click Key Button     ${temail_input1}
    UserManagement: Send Reset email link for user

Scenario: Reset password from reset mail by Public User
    [Tags]    User Management
    [Setup]     None
    Gmail: Read mail and open link       ${tgmail1}       ${tpswd1}        ${user_reset_expected_sub}     ${user_reset_expected_body}
    User: User On Reset Password Page     ${tnewpswd_input1}

Scenario: Login Public User with password reset by user
    [Tags]    User Management

    User: Public User on CivicServe Site     ${temail_input1}        ${tnewpswd_input1}        ${tuserlastname_input1}

Scenario: Reset password of Government User by Admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Search User     ${temail_input}
    UserManagement: Click Key Button     ${temail_input}
    UserManagement: Reset password by admin     ${treset_newpswd_input}

Scenario: Login Gov Admin User with password reset by admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${temail_input}        ${treset_newpswd_input}        ${tuserlastname_input}

Scenario: Reset password of Public User by Admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Navigate to Public User
    UserManagement: Search User     ${temail_input1}
    UserManagement: Click Key Button     ${temail_input1}
    UserManagement: Reset password by admin     ${treset_newpswd_input}

Scenario: Login Public User with password reset by admin
    [Tags]    User Management

    User: Public User on CivicServe Site     ${temail_input1}        ${treset_newpswd_input}        ${tuserlastname_input1}

Scenario: Login multiple times to lock gov admin user
    [Tags]    User Management

    User: User on Invalid Credentials Message Page     ${temail_input}        ${dev_invalidpassword}
    User: User on Invalid Credentials Message Page     ${temail_input}        ${dev_invalidpassword}
    User: User on Invalid Credentials Message Page     ${temail_input}        ${dev_invalidpassword}
    User: User on Invalid Credentials Message Page     ${temail_input}        ${dev_invalidpassword}
    User: User on Account Locked Message Page     ${temail_input}        ${dev_invalidpassword}

Scenario: Unlock Gov Admin User by Admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Search User     ${temail_input}
    UserManagement: Unlock User     ${temail_input}

Scenario: Gov Admin Login after unlock
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${temail_input}        ${treset_newpswd_input}        ${tuserlastname_input}

Scenario: Delete Government User by Admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Search User     ${temail_input}
    UserManagement: Delete User    ${temail_input}
    DB: Connect DB
    DB: Delete Government Admin User Data from Db     ${temail_input}
    DB: Disconnect DB

Scenario: Login Gov Admin User after delete
    [Tags]    User Management

    User: User on Invalid Credentials Message Page     ${temail_input}        ${treset_newpswd_input}

Scenario: Login multiple times to lock public user
    [Tags]    User Management

    User: User on Invalid Credentials Message Page     ${temail_input1}        ${dev_invalidpassword}
    User: User on Invalid Credentials Message Page     ${temail_input1}        ${dev_invalidpassword}
    User: User on Invalid Credentials Message Page     ${temail_input1}        ${dev_invalidpassword}
    User: User on Invalid Credentials Message Page     ${temail_input1}        ${dev_invalidpassword}
    User: User on Account Locked Message Page     ${temail_input1}        ${dev_invalidpassword}

Scenario: Unlock Public User by Admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Navigate to Public User
    UserManagement: Search User     ${temail_input1}
    UserManagement: Unlock User     ${temail_input1}

Scenario: Public user Login after unlock
    [Tags]    User Management

    User: Public User on CivicServe Site     ${temail_input1}        ${treset_newpswd_input}        ${tuserlastname_input1}


Scenario: Delete Public User by Admin
    [Tags]    User Management

    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Navigate to Settings Page        ${test_exp_admin_profile_name}
    Settings: Admin on User Management Page
    UserManagement: Navigate to Public User
    UserManagement: Search User     ${temail_input1}
    UserManagement: Delete User    ${temail_input1}
    DB: Connect DB
    DB: Delete Public User Data from Db     ${temail_input1}
    DB: Disconnect DB

Scenario: Login Public User after delete
    [Tags]    User Management

    User: User on Invalid Credentials Message Page     ${temail_input1}        ${treset_newpswd_input}



