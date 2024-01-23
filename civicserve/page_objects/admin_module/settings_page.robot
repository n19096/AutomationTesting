*** Settings ***
Documentation    This file contians page objects for admin home page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***
${general_tab_header}       xpath=//h3[contains(text(),'General')][not(contains(text(),'Information'))]
${user_management_tab}        xpath=//span[contains(text(),'User Management')]
${user_management_tab_header}        xpath=//h3[contains(text(),'User Management')]
${gov_users_menu}        xpath=//span[contains(text(),'Government Users')]
${inv_gov_user_btn}        xpath=//button[contains(text(),'Invite New Government User')]
${pub_users_menu}        xpath=//span[contains(text(),'Public Users')]
${inv_pub_user_btn}        xpath=//button[contains(text(),'Invite New Public User')]
${invuser_header}       xpath=//h5[contains(text(),'Invite a New User')]

${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${no_loader_icon}      xpath=//div[@id='loader'][@style='display: none;']
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]

#-------User Details---------
${userfirstname_input}       xpath=//input[@name='firstName']
${userlastname_input}       xpath=//input[@name='lastName']
${email_input}       xpath=//input[@name='email']
${phone_no_input}       xpath=//input[@name='phoneNumber']//parent::div//input[@autocomplete='off']
${timezone_dd}       xpath=//input[@name='timeZoneMinuteOffset']//parent::div//input[@autocomplete='off']
${timezone_central_option}      xpath=//div[contains(text(),'Central')]
${acct_type_input}       xpath=//input[@name='publicAccountType']//parent::div//input[@autocomplete='off']
${acct_type_buss_option}       xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Business Account')][not(contains(text(),'Resident'))]
#//div[@class='dx-overlay-content dx-popup-normal dx-resizable dx-dropdowneditor-overlay-flipped']//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Business')][not(contains(text(),'Resident'))]
${acct_type_buss_option1}       xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Business and Resident Account')]

#---------Government Details--------
${gov_entity_dd}       xpath=//input[@name='governmentEntityId']//parent::div//input[@autocomplete='off']
${gov_entity_option}       xpath=//div[contains(text(),'Progress City')]
${deptid_dd}        xpath=//input[@name='departmentId']//parent::div//input[@autocomplete='off']
${deptid_option}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'CivicServe')]
${deptid_option1}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Economic Development')]
${userroles_dd}        xpath=//select[@name='selectedRoles']//parent::div//input[@autocomplete='off']
${userrole_govtadmin_option}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Government Admin')]
${userrole_govtadmin_option1}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'CivicServe Admin')]
#---------Address Details---------
${address_line1}        xpath=//span[contains(text(),'Address Line 1')]//ancestor::label//following-sibling::div//input
${address_line2}        xpath=//span[contains(text(),'Address Line 2')]//ancestor::label//following-sibling::div//input
${addr_city}        xpath=//span[contains(text(),'City')]//ancestor::label//following-sibling::div//input
${addr_state}       xpath=//span[contains(text(),'State')]//ancestor::label//following-sibling::div//input
${addr_postal_code}     xpath=//span[contains(text(),'Postal Code')]//ancestor::label//following-sibling::div//input

${invite_btn}       xpath=//span[contains(text(),'Invite')]
${search_btn}       xpath=//div[@id='search-ctrl']//input
${edit_btn}     xpath=//tr//td[contains(text(),'test.civicserve@gmail.com')]//following-sibling::td//div[@class='edit-delete-actions']//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
${edit_header}      xpath=//h5[contains(text(),'Edit Government User')]
${update_btn}      xpath=//span[contains(text(),'Update')]
${key_btn}     xpath=//tr//td[contains(text(),'test.civicserve@gmail.com')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='key']
${reset_popup_btn}      xpath=//a[contains(text(),'Send Reset')]
${reset_newpswd_input}      xpath=//input[@name='newPassword']
${reset_cnfrm_newpswd_input}      xpath=//input[@name='confirmNewPassword']
${reset_pswd_btn}      xpath=//span[@class='dx-button-text'][contains(text(),'Reset Password')]
${delete_btn}     xpath=//tr//td[contains(text(),'test.civicserve@gmail.com')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='trash']
${unlock_btn}     xpath=//tr//td[contains(text(),'test.civicserve@gmail.com')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='unlock-keyhole']
${del_cnfrm_btn}     xpath=//span[contains(text(),'Confirm Deactivate User')]
${unlock_cnfrm_btn}     xpath=//span[contains(text(),'Confirm')]

#-----------Parcels----------
${districts_parcels_tab}        xpath=//span[contains(text(),'District, Zones & Parcels')]
${districts_parcels_tab_header}        xpath=//h3[contains(text(),'District, Zones & Parcels')]
${parcels_section_header}        xpath=//h3[contains(text(),'Parcels')]
${parcel_create_new_btn}        xpath=//h3[contains(text(),'Parcels')]//following-sibling::div//button[contains(text(),'Create New')]
${parcel_create_header}        xpath=//h3[contains(.,'Create') and contains(.,'Parcel')]
${search_parcel_btn}        xpath=//div[@class='dx-icon dx-icon-search']//following-sibling::input
${parcel_edit_btn}        xpath=//span[contains(text(),'020223207006')]//ancestor::td//following-sibling::td//div[@class='edit-delete-actions']//a//*[local-name()='svg' and @data-icon='arrow-right']
${parcel_id_input}        xpath=//input[@name='parcelId']
${parcel_dis_dd}        xpath=//select[@name='districtNames']//parent::div//input
${parcel_dis_option}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Main Street Corridor District')]
${parcel_addr1_input}        xpath=//input[@name='address.line1']
${parcel_city_input}        xpath=//input[@name='address.city']
${parcel_county_input}        xpath=//input[@name='address.county']
${parcel_state_input}        xpath=//input[@name='address.state']
${parcel_zip_input}        xpath=//input[@name='address.postalCode']
${parcel_lat_input}        xpath=//input[@name='address.latitude']
${parcel_long_input}        xpath=//input[@name='address.longitude']
${parcel_baseyr_input}        xpath=//input[@name='baseYear']
${parcel_baseyr_edit_input}        xpath=//input[@name='baseYear'][@type='hidden']//parent::div//following-sibling::div//input[@autocomplete='off']
${parcel_base_assemt_input}        xpath=//input[@name='baseAssessmentAmt']//parent::div//following-sibling::div//input
${parcel_sqfoot_input}        xpath=//input[@name='sqFt']
${parcel_sqfoot_edit_input}        xpath=//input[@name='sqFt'][@type='hidden']//parent::div//following-sibling::div//input[@autocomplete='off']
${parcel_usetype_dd}        xpath=//input[@name='useType']//parent::div//following-sibling::div//input
${parcel_usetype_option}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tparcel_usetype_option}')]
${parcel_submit_btn}        xpath=//span[contains(text(),'Submit')]
${parcel_update_header}        xpath=//h3[contains(.,'Update') and contains(.,'Parcel')]
${parcel_delete_btn}        xpath=//span[contains(text(),'020223207006')]//ancestor::td//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='trash']
${parcel_confirm_del_btn}       xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]
${dis_page_cnt}              xpath=//h3[ contains(text(),'Districts')]//ancestor::div[@class='panel']//div[@class='dx-pages-count']
${dis_nxt_pg}              xpath=//h3[ contains(text(),'Districts')]//ancestor::div[@class='panel']//div[@aria-label='Next Page']
${district_update_header}        xpath=//h3[contains(.,'Update') and contains(.,'District')]
${selected_programs_header}     xpath=//h3[contains(text(),'Selected Programs')]
${search_selected_programs_input}     xpath=//h3[contains(text(),'Selected Programs')]//parent::div//following-sibling::div//input[@aria-label='Search in the data grid']
${selected_parcels_header}     xpath=//h3[contains(text(),'Selected Parcels')]
${search_selected_parcels_input}     xpath=//h3[contains(text(),'Selected Parcels')]//parent::div//following-sibling::div//input[@aria-label='Search in the data grid']


#-----------------Notifications---------------------
${notifications_tab}     xpath=//span[contains(text(),'Notifications')]
${notifications_tab_header}     xpath=//h3[contains(text(),'Notifications')]
${notify_business_toggle_off}     xpath=//input[@name='notifyBusiness'][@value='false']
${notify_owners_toggle_off}     xpath=//input[@name='notifyOwners'][@value='false']
${issys_toggle_off}     xpath=//input[@name='isSystemRequired'][@value='false']
${create_notification_header}     xpath=//h3[contains(.,'Create') and contains(.,'Notification Setting')]
${create_new_notificn_btn}      xpath=//button[contains(text(),'Create New')]

${admin_usersto_notify_dd}      xpath=//select[@name='usersToNotify']//parent::div//following-sibling::div//input
${admin_usersto_notify_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tadmin_usersto_notify_option}')]
${admin_usersto_notify_option1}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tadmin_usersto_notify_option1}')]
${program_types_dd}      xpath=//select[@name='programTypes']//parent::div//following-sibling::div//input
${program_types_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprogram_types_option}')]
${program_types_option1}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprogram_types_option1}')]
${program_dd}      xpath=//select[@name='programs']//parent::div//following-sibling::div//input
${program_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprograms_option}')]
${program_option1}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprograms_option1}')]
${additional_email_addr}      xpath=//select[@name='additionalEmailAddresses']//parent::div//following-sibling::div//input
${notification_event_type_dd}      xpath=//input[@name='notificationEventType']//parent::div//following-sibling::div//input[@autocomplete='off']
${notification_event_type_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tnotification_event_type_option}')]
${notification_event_type_option1}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tnotification_event_type_option1}')]
${email_template_dd}      xpath=//input[@name='emailTemplateId']//parent::div//following-sibling::div//input[@autocomplete='off']
${email_template_option}      xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-dropdowneditor-overlay dx-dropdownlist-popup-wrapper dx-selectbox-popup-wrapper']//div[text()[contains(.,'${temail_template_option}')]]
#//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${temail_template_option}')]
${not_submit_btn}      xpath=//span[contains(text(),'Submit')]
${not_event_type_cell}      xpath=//td[contains(text(),'${tnotification_event_type_option}')][@aria-colindex='1']
${not_page_size_dd}     xpath=//div[@class='dx-page-sizes']//input[@autocomplete='off']
${not_page_size_option}     xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'100')]

${update_notification_header}     xpath=//h3[contains(.,'Update') and contains(.,'Notification Setting')]
${edit_notificn_btn}      xpath=//td[contains(text(),'${tnotification_event_type_option}')][@aria-colindex='1']//following-sibling::td[@aria-colindex=6]//button[@class='btn btn-info']
${not_sub_input}      xpath=//input[@name='subject']
${not_body_input}      xpath=//textarea[@name='body']//preceding-sibling::div//p
#//input[@name='body']
${not_email_remove_icon}      xpath=//input[@name='emailTemplateId']//parent::div//following-sibling::div//span[@class='dx-icon dx-icon-clear']
${delete_notificn_btn}      xpath=//td[contains(text(),'${tnotification_event_type_option1}')][@aria-colindex='1']//following-sibling::td[@aria-colindex=6]//button[@class='btn btn-danger']
${confirm_delete_notificn_btn}      xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***

Settings: Admin on User Management Page
    [Documentation]    Navigates to User Management page

    Wait Until Page Contains Element    ${user_management_tab}      20
    Find And Click Element    ${general_tab_header}
    Wait Until Element Is Visible    ${user_management_tab}     20
    Find And Click Element    ${user_management_tab}
    Wait Until Page Contains Element    ${user_management_tab_header}       20

UserManagement: Click Invite New Government User
    [Documentation]    Clicks Invite new government user

    Find And Click Element    ${gov_users_menu}
    Wait Until Page Contains Element    ${inv_gov_user_btn}      20
    Find And Click Element    ${inv_gov_user_btn}
    Wait Until Page Contains Element    ${invuser_header}       20

UserManagement: Fill User Details to invite user
    [Documentation]    Fills user details to invite user
    [Arguments]     ${tuserfirstname_input}     ${tuserlastname_input}     ${temail_input}  ${tphone_no_input}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${userfirstname_input}      20
    Input Text for New Fields       ${userfirstname_input}      ${tuserfirstname_input}
    Input Text for New Fields       ${userlastname_input}      ${tuserlastname_input}
    Input Text for New Fields       ${email_input}      ${temail_input}
    Input Text for New Fields       ${phone_no_input}      ${tphone_no_input}
    Find And Click Element    ${timezone_dd}
    Find And Click Element    ${timezone_central_option}

UserManagement: Select Account Type for public user
    [Documentation]    selects account type to invite public user
    Find And Click Element    ${acct_type_input}
    Hover Mouse    ${acct_type_buss_option}
    Find And Click Element    ${acct_type_buss_option}

UserManagement: Fill Government Details to invite user
    [Documentation]    Fills user details to invite user
    
    Run Keyword And Ignore Error    Scroll Element Into View    ${gov_entity_dd}
    Hover Mouse    ${gov_entity_dd}
    Find And Click Element    ${gov_entity_dd}
    Hover Mouse    ${gov_entity_option}
    Find And Click Element    ${gov_entity_option}
    Find And Click Element    ${deptid_dd}
    Hover Mouse    ${deptid_option}
    Find And Click Element    ${deptid_option}
    Find And Click Element    ${userroles_dd}
    Find And Click Element    ${userrole_govtadmin_option}


UserManagement: Fill Address Details to invite user
    [Documentation]    Fills user details to invite user

    Run Keyword And Ignore Error    Scroll Element Into View    ${address_line1}
    Input Text for New Fields       ${address_line1}      ${taddress_line1}
    Input Text for New Fields       ${address_line2}      ${taddress_line2}
    Input Text for New Fields       ${addr_city}      ${taddr_city}
    Input Text for New Fields       ${addr_state}      ${taddr_state}
    Input Text for New Fields       ${addr_postal_code}      ${taddr_postal_code}

UserManagement: Navigate to Public User
    [Documentation]    Navigates to public user

    Wait Until Page Contains Element    ${pub_users_menu}      20
    Find And Click Element    ${pub_users_menu}
    Wait Until Page Contains Element    ${inv_pub_user_btn}      20

UserManagement: Click Invite New Public User
    [Documentation]    Clicks Invite new public user

    Find And Click Element    ${pub_users_menu}
    Wait Until Page Contains Element    ${inv_pub_user_btn}      20
    Find And Click Element    ${inv_pub_user_btn}
    Wait Until Page Contains Element    ${invuser_header}       20

UserManagement: Click Invite Button
    [Documentation]    Clicks Invite button to invite user

    Run Keyword And Ignore Error    Scroll Element Into View    ${invite_btn}
    Find And Click Element    ${invite_btn}
    Wait Until Page Does Not Contain Element    ${invite_btn}       30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${added_success_msg}     30

UserManagement: Search User
    [Documentation]    Clicks search button
    [Arguments]     ${temail_input}

    Run Keyword And Ignore Error    Scroll Element Into View    ${search_btn}
    Input Text for New Fields    ${search_btn}    ${temail_input}
    Press Keys    ${search_btn}    ENTER
    Wait Until Page Does Not Contain Element    ${loader_icon}      60

UserManagement: Click Edit Button
    [Documentation]    Clicks edit button of user
    [Arguments]     ${email}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
    Find And Click Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
#    Wait Until Page Contains Element    ${edit_header}  15

UserManagement: Edit User Details
    [Documentation]    edits user details
    [Arguments]     ${tuserfirstname_input}     ${tuserlastname_input}     ${temail_input}  ${tphone_no_input}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${userfirstname_input}      20
    Clear And Type Into Element       ${userfirstname_input}      ${tuserfirstname_input}
    Clear And Type Into Element       ${userlastname_input}      ${tuserlastname_input}
    Clear And Type Into Element       ${email_input}      ${temail_input}
    Clear And Type Into Element       ${phone_no_input}      ${tphone_no_input}
    Hover Mouse    ${timezone_dd}
    Find And Click Element    ${timezone_dd}
    Hover Mouse    ${timezone_central_option}
    Find And Click Element    ${timezone_central_option}

UserManagement: Edit Selected Account Type for public user
    [Documentation]    edits selected account type of public user

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Find And Click Element    ${acct_type_input}
    Hover Mouse    ${acct_type_buss_option1}
    Find And Click Element    ${acct_type_buss_option1}

UserManagement: Edit Government Details
    [Documentation]    Edits government details of government user

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Run Keyword And Ignore Error    Scroll Element Into View    ${gov_entity_dd}
    Hover Mouse    ${gov_entity_dd}
    Find And Click Element    ${gov_entity_dd}
    Hover Mouse    ${gov_entity_option}
    Find And Click Element    ${gov_entity_option}
    Find And Click Element    ${deptid_dd}
    Find And Click Element    ${deptid_option1}
    Find And Click Element    ${userroles_dd}
    Find And Click Element    ${userrole_govtadmin_option1}


UserManagement: Edit Address Details
    [Documentation]    Edits address details

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Run Keyword And Ignore Error    Scroll Element Into View    ${address_line1}
    Clear And Type Into Element       ${address_line1}      ${tedit_address_line1}
    Clear And Type Into Element       ${address_line2}      ${tedit_address_line2}
    Clear And Type Into Element       ${addr_city}      ${tedit_addr_city}
    Clear And Type Into Element       ${addr_state}      ${tedit_addr_state}
    Clear And Type Into Element       ${addr_postal_code}      ${tedit_addr_postal_code}

UserManagement: Click On Update Button
    [Documentation]    Clicks update button

    Wait Until Page Contains Element        ${update_btn}
    Find And Click Element    ${update_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Does Not Contain Element    ${update_btn}       30

UserManagement: Click Key Button
    [Documentation]    Clicks key button of user
    [Arguments]     ${email}

    Wait Until Page Contains Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='key']
    Find And Click Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='key']
    Wait Until Page Does Not Contain Element    ${loader_icon}      30

UserManagement: Delete User
    [Documentation]    Clicks delete button of user
    [Arguments]     ${email}

    Wait Until Page Contains Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='trash']
    Find And Click Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='trash']
    Wait Until Page Contains Element    ${del_cnfrm_btn}      30
    Find And Click Element    ${del_cnfrm_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30

UserManagement: Unlock User
    [Documentation]    Clicks unlock button of user
    [Arguments]     ${email}

    Wait Until Page Contains Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='unlock-keyhole']
    Find And Click Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='unlock-keyhole']
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${unlock_cnfrm_btn}     20
    Find And Click Element    ${unlock_cnfrm_btn}
    Wait Until Page Contains Element    //tr//td[contains(text(),'${email}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='lock']     20

UserManagement: Send Reset email link for user
    [Documentation]    Clicks send reset email link button of user

    Wait Until Page Contains Element    ${reset_popup_btn}
    Hover Mouse    ${reset_popup_btn}
    Find And Click Element    ${reset_popup_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    
UserManagement: Reset password by admin
    [Documentation]    Reset password of user by admin
    [Arguments]     ${treset_newpswd_input}
    
    Wait Until Page Contains Element    ${reset_newpswd_input}      60
    Input Text for New Fields    ${reset_newpswd_input}    ${treset_newpswd_input}
    Input Text for New Fields    ${reset_cnfrm_newpswd_input}    ${treset_newpswd_input}
    Find And Click Element    ${reset_pswd_btn}
    Wait Until Page Does Not Contain Element    ${reset_pswd_btn}   20
    Wait Until Page Contains Element    ${added_success_msg}     30

Settings: Admin on Districts Zones And Parcels Page
    [Documentation]    Navigates to Districts Zones And Parcels page

    Wait Until Page Contains Element    ${districts_parcels_tab}      120
#    Find And Click Element    ${general_tab_header}
    Wait Until Element Is Visible    ${districts_parcels_tab}
    Find And Click Element    ${districts_parcels_tab}
    Wait Until Page Contains Element    ${districts_parcels_tab_header}       20
    Wait Until Page Does Not Contain Element    ${loader_icon}      120

Parcels: Scroll to Parcels Header
    [Documentation]    Scrolls to Parcels header

    Wait Until Page Contains Element    ${parcels_section_header}      20
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcels_section_header}

Parcels: Click Create New Parcel
    [Documentation]    CLicks create new parcel
    Find And Click Element    ${parcel_create_new_btn}
    Wait Until Page Contains Element    ${parcel_create_header}      20

Parcels: Search for a Parcel
    [Documentation]    Search for parcel
    [Arguments]     ${tparcel_id_input}

    Wait Until Page Contains Element    ${search_parcel_btn}
    Input Text for New Fields    ${search_parcel_btn}       ${tparcel_id_input}

Parcels:Validate presence of Parcel
    [Documentation]     Validation of parcel presence
    [Arguments]     ${tparcel_id_input}
    Wait Until Page Contains Element    //span[contains(text(),'${tparcel_id_input}')]        20

Parcels:Validate deletion of Parcel
    [Documentation]     Validation of parcel presence
    [Arguments]     ${tparcel_id_input}
    Wait Until Page Does Not Contain Element    //span[contains(text(),'${tparcel_id_input}')]        20

Parcels: Click Edit Parcel
    [Documentation]    CLicks edit parcel
    [Arguments]     ${tparcel_id_input}
    Find And Click Element    xpath=//span[contains(text(),'${tparcel_id_input}')]//ancestor::td//following-sibling::td//div[@class='edit-delete-actions']//a//*[local-name()='svg' and @data-icon='arrow-right']
    Wait Until Page Contains Element    ${parcel_update_header}      20
    Wait Until Page Does Not Contain Element    ${loader_icon}      30

Parcels: Fill in Details to Create Parcels
    [Documentation]    Filling details to create parcels
    [Arguments]     ${tparcel_id_input}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Input Text for New Fields    ${parcel_id_input}    ${tparcel_id_input}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Hover Mouse    ${parcel_dis_dd}
    Find And Click Element    ${parcel_dis_dd}
    Hover Mouse    ${parcel_dis_option}
    Find And Click Element    ${parcel_dis_option}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Input Text for New Fields    ${parcel_addr1_input}    ${tparcel_addr1_input}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Input Text for New Fields    ${parcel_city_input}    ${tparcel_city_input}
    Input Text for New Fields    ${parcel_county_input}    ${tparcel_county_input}
    Input Text for New Fields    ${parcel_state_input}    ${tparcel_state_input}
    Input Text for New Fields    ${parcel_zip_input}    ${tparcel_zip_input}
    Input Text for New Fields    ${parcel_lat_input}    ${tparcel_lat_input}
    Input Text for New Fields    ${parcel_long_input}    ${tparcel_long_input}
    Input Text for New Fields    ${parcel_baseyr_input}    ${tparcel_baseyr_input}
    Input Text for New Fields    ${parcel_base_assemt_input}    ${tparcel_base_assemt_input}
    Input Text for New Fields    ${parcel_sqfoot_input}    ${tparcel_sqfoot_input}
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcel_usetype_dd}
    Find And Click Element    ${parcel_usetype_dd}
    Find And Click Element    ${parcel_usetype_option}
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcel_submit_btn}
    Find And Click Element    ${parcel_submit_btn}
    Wait Until Page Contains Element    ${added_success_msg}       30

Parcels: Fill in Details to Edit Parcel
    [Documentation]    Filling details to edit parcel
    [Arguments]     ${tparcel_id_input}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Clear And Type Into Element    ${parcel_id_input}    ${tparcel_id_input}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Clear And Type Into Element    ${parcel_addr1_input}    ${tparcel_addr1_input}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Clear And Type Into Element    ${parcel_city_input}    ${tparcel_city_input}
    Clear And Type Into Element    ${parcel_county_input}    ${tparcel_county_input}
    Clear And Type Into Element    ${parcel_state_input}    ${tparcel_state_input}
    Clear And Type Into Element    ${parcel_zip_input}    ${tparcel_zip_input}
    Clear And Type Into Element    ${parcel_lat_input}    ${tparcel_lat_input}
    Clear And Type Into Element    ${parcel_long_input}    ${tparcel_long_input}
    Clear And Type Into Element    ${parcel_baseyr_edit_input}    ${tparcel_baseyr_input}
    Clear And Type Into Element    ${parcel_base_assemt_input}    ${tparcel_base_assemt_input}
    Clear And Type Into Element    ${parcel_sqfoot_edit_input}    ${tparcel_sqfoot_input}
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcel_usetype_dd}
    Find And Click Element    ${parcel_usetype_dd}
    Find And Click Element    ${parcel_usetype_option}
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcel_submit_btn}
    Find And Click Element    ${parcel_submit_btn}
    Wait Until Page Contains Element    ${added_success_msg}       30

Parcels: Click Delete Parcel
    [Documentation]    CLicks edit parcel
    [Arguments]     ${tparcel_id_input}

    Wait Until Page Contains Element    xpath=//span[contains(text(),'${tparcel_id_input}')]    20
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//span[contains(text(),'${tparcel_id_input}')]
    Find And Click Element    xpath=//span[contains(text(),'${tparcel_id_input}')]//ancestor::td//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='trash']
    Hover Mouse    ${parcel_confirm_del_btn}
    Find And Click Element      ${parcel_confirm_del_btn}
    Wait Until Page Contains Element    ${deleted_success_msg}       30

Parcels: Go through pages for a district
    [Documentation]    goes through pages for a district
    [Arguments]     ${tdistrict_name_input}


    Wait Until Element Is Not Visible       ${loader_icon}      30
#    Wait Until Page Contains Element        ${first_cont_edit_btn}
    ${page_cnt} =   Get Text    ${dis_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${tdistrict_name_input}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != True
            Find And Click Element     ${dis_nxt_pg}
            Wait Until Element Is Not Visible    ${loader_icon}     30
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${tdistrict_name_input}')][1]
        END

District: Click Edit District
    [Documentation]    Clicks edit district
    [Arguments]     ${tdis_name}
    
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//td[contains(text(),'${tdis_name}')]//following-sibling::td[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='pen-to-square']
    Find And Click Element    xpath=//td[contains(text(),'${tdis_name}')]//following-sibling::td[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='pen-to-square']
    Wait Until Page Contains Element    ${district_update_header}      20
    Wait Until Page Does Not Contain Element    ${loader_icon}      30

District: Search a program in districts page
    [Documentation]    Searches a program
    [Arguments]     ${tprog_name}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Run Keyword And Ignore Error    Scroll Element Into View    ${selected_programs_header}
    Wait Until Page Contains Element    ${search_selected_programs_input}      20
    Run Keyword And Ignore Error    Scroll Element Into View    ${search_selected_programs_input}
    Input Text for New Fields       ${search_selected_programs_input}       ${tprog_name}
    Press Keys    ${search_selected_programs_input}    ENTER
    Wait Until Page Does Not Contain Element    ${loader_icon}      20

District: Assign district to a program if not asssigned
    [Documentation]    Assigns district to a program
    [Arguments]     ${tprog_name}


    ${Result} =     Run Keyword And Return Status    Page Should Contain Element   xpath=//td[contains(text(),'${tprog_name}')]//following-sibling::td//span[@class='dx-checkbox-icon']//parent::div//preceding-sibling::input[@value='true']
    Wait Until Page Contains Element    xpath=//td[contains(text(),'${tprog_name}')]//following-sibling::td//span[@class='dx-checkbox-icon']      20
    IF    ${Result} == False
         Find And Click Element    xpath=//td[contains(text(),'${tprog_name}')]//following-sibling::td//span[@class='dx-checkbox-icon']
         Wait Until Page Contains Element    ${added_success_msg}        20
    END


District: Search a parcel in districts page
    [Documentation]    Searches a program
    [Arguments]     ${tparcel_id}

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Run Keyword And Ignore Error    Scroll Element Into View    ${selected_parcels_header}
    Wait Until Page Contains Element    ${search_selected_parcels_input}      20
#    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//div[contains(text(),'Parcel ID')]
    Input Text for New Fields       ${search_selected_parcels_input}       ${tparcel_id}
#    Press Keys    ${search_selected_parcels_input}    ENTER
    Wait Until Page Does Not Contain Element    ${loader_icon}      60

District: Assign parcel to District
    [Documentation]    assigns parcel to a district
    [Arguments]     ${tparcel_id}

#    //span[contains(text(),'020223207026')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']
    Wait Until Page Contains Element    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']      30
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']
    Find And Click Element    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']
    Wait Until Page Contains Element    ${added_success_msg}        20

District: Unassign parcel to District
    [Documentation]    assigns parcel to a district
    [Arguments]     ${tparcel_id}

#    //span[contains(text(),'020223207026')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']
    Wait Until Page Contains Element    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']//parent::div//parent::div//input[@type='hidden'][@value='true']      30
#    Wait Until Page Contains Element    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']//parent::div//parent::div//input[@type='hidden'][@value='true']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']
    Find And Click Element    xpath=//span[contains(text(),'${tparcel_id}')]//ancestor::td//following-sibling::td//span[@class='dx-checkbox-icon']
    Wait Until Page Contains Element    ${added_success_msg}        20

Settings: Admin on Notifications Page
    [Documentation]    Navigates to notifications page

    Wait Until Page Contains Element    ${notifications_tab}      60
#    Find And Click Element    ${general_tab_header}
    Wait Until Element Is Visible    ${notifications_tab}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}  60
    Find And Click Element    ${notifications_tab}
    Wait Until Page Contains Element    ${notifications_tab_header}      60
    Wait Until Page Does Not Contain Element    ${loader_icon}  60

Notifications: Create New Notification
    [Documentation]    creates new notification

    Wait Until Page Does Not Contain Element    ${loader_icon}  60
    Find And Click Element    ${create_new_notificn_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${create_notification_header}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${notify_business_toggle_off}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${notify_owners_toggle_off}     60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${issys_toggle_off}     60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${admin_usersto_notify_dd}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Hover Mouse    ${admin_usersto_notify_dd}
    Find And Click Element    ${admin_usersto_notify_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${admin_usersto_notify_option}
    Hover Mouse    ${admin_usersto_notify_option}
    Find And Click Element    ${admin_usersto_notify_option}
    Find And Click Element    ${admin_usersto_notify_dd}
#    Hover Mouse    ${program_types_dd}
#    Find And Click Element    ${program_types_dd}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${program_types_option}
#    Hover Mouse    ${program_types_option}
#    Find And Click Element    ${program_types_option}
#    Hover Mouse    ${program_dd}
#    Find And Click Element    ${program_dd}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${program_option}
#    Hover Mouse    ${program_option}
#    Find And Click Element    ${program_option}
#    Find And Click Element    ${additional_email_addr}
#    Input Text for New Fields    ${additional_email_addr}    ${temail_input}
    Hover Mouse    ${notification_event_type_dd}
    Find And Click Element    ${notification_event_type_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${notification_event_type_option}
    Hover Mouse    ${notification_event_type_option}
    Find And Click Element    ${notification_event_type_option}
    Run Keyword And Ignore Error    Scroll Element Into View        ${not_submit_btn}
    Hover Mouse    ${email_template_dd}
    Find And Click Element    ${email_template_dd}
    Hover Mouse    ${email_template_option}
    Find And Click Element    ${email_template_option}
    Run Keyword And Ignore Error    Scroll Element Into View    ${not_submit_btn}
    Find And Click Element    ${not_submit_btn}
    Wait Until Page Contains Element    ${added_success_msg}        40

Notifications: Edit Existing Notification
    [Documentation]    Edits existing notification

    Wait Until Page Does Not Contain Element    ${loader_icon}  60
    Find And Click Element    ${edit_notificn_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${update_notification_header}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${notify_business_toggle_off}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${notify_owners_toggle_off}     60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${issys_toggle_off}     60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element        ${admin_usersto_notify_dd}       60
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Hover Mouse    ${admin_usersto_notify_dd}
    Find And Click Element    ${admin_usersto_notify_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${admin_usersto_notify_option1}
    Hover Mouse    ${admin_usersto_notify_option1}
    Find And Click Element    ${admin_usersto_notify_option1}
#    Hover Mouse    ${program_types_dd}
#    Find And Click Element    ${program_types_dd}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${program_types_option1}
#    Hover Mouse    ${program_types_option1}
#    Find And Click Element    ${program_types_option1}
#    Hover Mouse    ${program_dd}
#    Find And Click Element    ${program_dd}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${program_option1}
#    Hover Mouse    ${program_option1}
#    Find And Click Element    ${program_option1}
#    Find And Click Element    ${additional_email_addr}
#    Input Text for New Fields    ${additional_email_addr}    ${temail_input}
    Hover Mouse    ${notification_event_type_dd}
    Find And Click Element    ${notification_event_type_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${notification_event_type_option1}
    Hover Mouse    ${notification_event_type_option1}
    Find And Click Element    ${notification_event_type_option1}
    Find And Click Element    ${not_email_remove_icon}
    Wait Until Page Contains Element    ${not_sub_input}    30
    Run Keyword And Ignore Error    Scroll Element Into View        ${not_submit_btn}
    Input Text for New Fields    ${not_sub_input}      ${tnot_sub_input}
    Input Text for New Fields    ${not_body_input}      ${tnot_body_input}
    Run Keyword And Ignore Error    Scroll Element Into View    ${not_submit_btn}
    Find And Click Element    ${not_submit_btn}
    Wait Until Page Contains Element    ${added_success_msg}        40

Notifications: Validate Created Notification
    [Documentation]    validates created  notification
    [Arguments]     ${tnotification_event_type_option}

    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element    xpath=//td[contains(text(),'${tnotification_event_type_option}')][@aria-colindex='1']      60

Notifications: Change the notifications page size to hundred
    [Documentation]    changes page size to hundered

    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element    ${not_page_size_dd}     20
    Find And Click Element    ${not_page_size_dd}
    Wait Until Page Contains Element    ${not_page_size_option}     30
    Hover Mouse    ${not_page_size_option}
    Find And Click Element    ${not_page_size_option}
    Wait Until Page Does Not Contain Element    ${loader_icon}      60


Notifications: Delete Existing Notification
    [Documentation]    deleted existing notification
    [Arguments]     ${tnotification_event_type_option}

    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element    ${delete_notificn_btn}      60
    Find And Click Element    ${delete_notificn_btn}
    Wait Until Page Contains Element    ${confirm_delete_notificn_btn}      30
    Find And Click Element    ${confirm_delete_notificn_btn}
    Wait Until Page Contains Element    ${deleted_success_msg}     60


Notifications: Validate Deleted Notification
    [Documentation]    validates created  notification
    [Arguments]     ${tnotification_event_type_option}

    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Does not Contain Element    xpath=//td[contains(text(),'${tnotification_event_type_option}')][@aria-colindex='1']      60