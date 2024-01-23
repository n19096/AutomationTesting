*** Settings ***
Documentation     Test scenarios to perform actions on contacts page

Test Setup       Open Browser For Testing
Test Teardown     Close Browser Window

Resource    ../../../page_objects/test_setup.robot

*** Test Cases ***

Create a contact
    [Tags]    Contact
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on People contacts
    Contacts: Create a new Contact

Edit a contact
    [Tags]    Contact
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on People contacts
    Contacts: Search a Contact      ${tfirst_name}
    Contacts: Go through the pages for specific contact    ${tfirst_name}
    Contacts: Edit a Contact

Email a contact and Validate send email
    [Tags]    Contact
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on People contacts
    Contacts: Search a Contact      ${tedit_first_name}
    Contacts: Go through the pages for specific contact    ${tedit_first_name}
    Gmail: Delete Mails in inbox        ${tgmail}       ${tpswd}
    Contacts: Send Email to a Contact
    Gmail: Read mail in inbox       ${tgmail}       ${tpswd}        ${expected_sub}     ${expected_body}
    AdminHome: Admin on Email History
    EmailHistory: Validate Email sent Is added in History

Delete a contact
    [Tags]    Contact
    Admin: User on CivicServe Admin Site     ${test_admin_username}        ${test_admin_password}        ${test_exp_admin_profile_name}
    AdminHome: Admin on People contacts
    Contacts: Search a Contact      ${tedit_first_name}
    Contacts: Go through the pages for specific contact    ${tedit_first_name}
    Contacts: Delete a Contact


