*** Settings ***
Documentation    This file contians page objects for program management page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot

Library    SeleniumLibrary

*** Variables ***
#
${create_new_btn}     xpath=//button[@class='btn btn-primary'][contains(text(),'Create New')]
${add_program_popup_header}     xpath=//div[contains(text(),'New Program')]
${program_name}     xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${new_program_type_dd}      xpath=//label//span[contains(text(),'Program Type:')]//ancestor::label//following-sibling::div//div[@data-dx_placeholder='Select...']//preceding-sibling::input
#//label//span[contains(text(),'Program Type:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${program_type_tif_option}      xpath=//div[@role='option']//div[contains(text(),'TIF')]
${program_add_btn}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]
#${prog_page_cnt}        xpath=//div[@class='dx-pages-count']
#${prog_nxt_pg}              xpath=//div[@aria-label='Next Page']
${create_div_popup}         xpath=//div[@class='dx-popup-content']
${program_name_header}      xpath=//h3[contains(text(),'${ttif_program_name}')]
${program_name_text_in_programs}      xpath=//td[contains(text(),'${ttif_program_name}')]

${edit_btn}         xpath=//tr//td[3][contains(text(),'${ttif_program_name}')]//parent::tr//td[8]//a/button[@class='btn btn-info']
#General Info
${general_info}             xpath=//span[contains(text(),'General Information')]
#${gen_info_live_proj_chkbx}            xpath=//span[contains(text(),'Live Project:')]//ancestor::label//following-sibling::div//span[@class='dx-checkbox-icon']
${gen_info_active_proj_toggle}            xpath=//span[contains(text(),'Active Program')]//ancestor::label//following-sibling::div//div[@class='dx-switch-handle']
${gen_info_active_toggle_yes_btn}            xpath=//span[contains(text(),'Yes')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${gen_info_program_name}            xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input
${shrt_description}         xpath=//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//textarea[@name='publicShortDescription']//preceding-sibling::div//p
${existing_shrt_description_ele}         xpath=//span[contains(text(),'Public Short Description')]//ancestor::div[@class='dx-item dx-box-item']//p[contains(text(),'TIF')]
#need to check on this if working as we are getting 2 elements with this xpath
${description}              xpath=//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//textarea[@name='description']//preceding-sibling::div//div[@role='textbox']
${cont_info}                xpath=//label//span[contains(text(),'Contact Information:')]//ancestor::label//following-sibling::div//input
${allow_business_applicants}       xpath=//label//span[contains(text(),'Allow Business Applicants:')]//ancestor::label//following-sibling::div//div[@class='dx-switch-handle']
#//label//span[contains(text(),'Allow Business Applicants:')]//ancestor::label//following-sibling::div//span
${strt_dt}          xpath=//label//span[contains(text(),'Start Date:')]//ancestor::label//following-sibling::div//div[@class='dx-texteditor-input-container']//input[@class='dx-texteditor-input'][@aria-autocomplete='list']
${end_dt}           xpath=//label//span[contains(text(),'End Date:')]//ancestor::label//following-sibling::div//div[@class='dx-texteditor-input-container']//input[@class='dx-texteditor-input'][@aria-autocomplete='list']
${general_info_save_btn}            xpath=//span[contains(text(),'Save')]

#Popup
${divpopup}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']

#Policies
${policies_and_procedures}          xpath=//span[contains(text(),'Policies / Procedures')]
${policies_header}      xpath=//h3[contains(text(),'Policies')]
${add_policy_btn}           xpath=//a[@class='btn btn-primary'][contains(text(),'Add')]
${policy_popup_header}      xpath=//div[contains(text(),'Add Policy')]
${policy_name}              xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@role='textbox']
${policy_desc}              xpath=//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//p
${policy_popup_add_btn}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]
${policy_popup_cancel_btn}      xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Cancel']//span[contains(text(),'Cancel')]
#ApplicationSteps
${application_steps}                xpath=//span[contains(text(),'Application Steps')]
${app_steps_header}                 xpath=//h3[contains(text(),'Application Steps')]
#${program_header}                 xpath=//h3[contains(text(),'${ttif_program_name}')]
#${add_application_stage}            xpath=//a[@class='btn btn-primary'][contains(text(),'Add')]
${add_application_stage}            xpath=//div[@class='fw-bold'][contains(text(),'${tapplication_step_name12}')]//ancestor::div[@class='row g-2']//*[local-name()='svg' and @data-icon='plus']
${application_step_popup_header}        xpath=//div[contains(text(),'Add Application Step')]
${application_step_name}            xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${application_desc}                 xpath=//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//p
${program_type_dd}     xpath=//span[contains(text(),'Application Step Type:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
#${program_type_option}     xpath=//div[contains(text(),'${tprogram_type}')]
${manual_approved_toggle}           xpath=//label//span[contains(text(),'Must Be Manually Approved For Applicant To Complete:')]//ancestor::label//following-sibling::div//span
${is_locked_toggle}                 xpath=//label//span[contains(text(),'Is Locked:')]//ancestor::label//following-sibling::div//span
#${ret_view_dd}
${is_printable_toggle}              xpath=//label//span[contains(text(),'Is Printable:')]//ancestor::label//following-sibling::div//span
${applicationstep_popup_add_btn}        xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]
${applicationstep_popup_cancel_btn}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Cancel']//span[contains(text(),'Cancel')]
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]
#//div[@role='alert'][contains(text(),'Added Successfully')]
#Notifications
${notification_settings}            xpath=//span[contains(text(),'Notification Settings')]
${notifications_header}             xpath=//h3[contains(text(),'Notification Settings')]
${notification_event_type_view}     xpath=//tr//td[contains(text(),'${tnotification_event_type_name}')]//following-sibling::td//a

#Applicant Info
${appl_info}        xpath=//div[@class='fw-bold'][contains(text(),'Applicant Information')]//parent::div//following-sibling::div//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='arrow-right']
${appl_info_header}             xpath=//h3[contains(text(),'Applicant Information')]
${accepting_applications_togg}             xpath=//div[@class='dx-switch-container']
${target_aud_dd}      xpath=//input[@name='targetedAudience']//parent::div//input[@autocomplete='off']
${target_aud_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${ttarget_aud_option}')]
${appl_info_save_btn}      xpath=//span[contains(text(),'Save')]
#Required Party Info
${req_party_info}           xpath=//div[@class='fw-bold'][contains(text(),'Party Information')]//parent::div//following-sibling::div//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='arrow-right']
#//span[contains(text(),'Required Party Info')]
${req_party_info_header}        xpath=//h3[contains(text(),'Parties')]
${add_party_btn}            xpath=//a[@class='btn btn-primary'][contains(text(),'Add')]
${party_popup_header}        xpath=//div[contains(text(),'Add Party')]
${profile_type}             xpath=//label//span[contains(text(),'Profile Type:')]//ancestor::label//following-sibling::div//input[@role='combobox']
${profile_type_opt1}            xpath=//div[contains(text(),'General Contractor')]
#//parent::div
${party_popup_header}           xpath=//div[contains(text(),'Add Party')]
${party_name}               xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
#need to check on this if working
${is_req_toggle_on}            xpath=//div[@class='dx-switch-on']
${is_req_toggle_off}            xpath=//div[@class='dx-switch-off']
#//label//span[contains(text(),'Required:')]//ancestor::label//following-sibling::div//div[@class='dx-switch-container']
${party_popup_cancel_btn}           xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Cancel']//span[contains(text(),'Cancel')]
${party_popup_add_btn}           xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]


#Districts
${districts}        xpath=//span[contains(text(),'Districts')]
${districts_header}        xpath=//h3[contains(text(),'Districts')]
${assigned_to_prog_checkbox}        xpath=//td[contains(text(),'${tdistrict_name1}')]//following-sibling::td//span[@class='dx-checkbox-icon']
${assigned_success_msg}     xpath=//div[@role='alert'][contains(text(),'Assigned Program To District')]

#FundingSources
${funding_sources}      xpath=//div[@class='fw-bold'][contains(text(),'Sources of Funds')]//parent::div//following-sibling::div//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='arrow-right']
#//span[contains(text(),'Financing Details')]
#//span[contains(text(),'Funding Sources')]
${funding_sources_header}        xpath=//h3[contains(text(),'Funding Sources')]
${subsidytypes_header}      xpath=//h3[contains(text(),'Subsidy Types')]
${subsidytypes_select}      xpath=//div[@class='dx-texteditor-input-container dx-tag-container']
#//input[@autocomplete='off']
${property_tax_sub_type}        xpath=//div[contains(text(),'Property Tax')]
#//preceding-sibling::div//span[@class='dx-checkbox-icon']
${none_specified_checkbox}      xpath=//span[contains(text(),'Not Specified')]//preceding-sibling::span
${add_fund_cat_btn}         xpath=//a[@class='btn btn-primary'][contains(text(),'Add')]
${funding_sources_popup_header}        xpath=//div[contains(text(),'Add Fund Source Category')]
${fund_name}            xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${fund_desc}            xpath=//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//p
${fund_popup_cancel_btn}        xpath=//span[contains(text(),'Cancel')]
${fund_popup_add_btn}            xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]
${fund_cat_popup_header}        xpath=//div[contains(text(),'Add Fund Source')]
${fund_add_categories_btn}           xpath=//td[contains(text(),'${tfund_name}')]//following-sibling::td//button[@class='btn btn-info'][1]
${fund_cat_name}            xpath=//div[@class='dx-overlay-content dx-popup-normal dx-resizable']//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@role='textbox']
${add_fundtocat_popup_add_btn}          xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]
${add_fundtocat_popup_cancel_btn}           xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Cancel']//span[contains(text(),'Cancel')]

#Eligible Costs
${eg_costs}     xpath=//div[@class='fw-bold'][contains(text(),'Eligible Costs')]//parent::div//following-sibling::div//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='arrow-right']
#//span[contains(text(),'Eligible Costs')]
${ec_header}      xpath=//h3[contains(text(),'Eligible Costs')]
${add_ec_cat_btn}      xpath=//a[@class='btn btn-primary']
${ec_popup_header}        xpath=//div[contains(text(),'Add Eligible Cost Category')]
${ec_name}      xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@role='textbox']
${ec_desc}      xpath=//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//div[@role='textbox']
#//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//p
${ec_cancel_btn}        xpath=//span[contains(text(),'Cancel')]
${ec_add_btn}       xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]
${ec_add_categories_btn}    xpath=//span[contains(text(),'${tec_name}')]//parent::td//following-sibling::td//button[@class='btn btn-info'][1]
${ec_categories_name}       xpath=//div[@class='dx-overlay-content dx-popup-normal dx-resizable']//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@role='textbox']
${ec_categories_popup_cancel_btn}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Cancel']//span[contains(text(),'Cancel')]
${ec_categories_popup_add_btn}        xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]

#Eligible Construction Activity
${elg_cons_act}     xpath=//div[@class='fw-bold'][contains(text(),'Proposed Project Information')]//parent::div//following-sibling::div//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='arrow-right']
#//span[contains(text(),'Eligible Construction Activity')]
${add_elig_cons_cat_btn}      xpath=//a[@class='btn btn-primary']
${elig_const_act_popup_header}        xpath=//div[contains(text(),'Add Eligible Construction Activity Category')]
${elg_name}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@role='textbox']
${elg_type_dd}     xpath=//span[contains(text(),'Type:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${elg_type_option}     xpath=//div[@role='option']//div[contains(text(),'${telg_type_option}')]
${elg_type_accordion}     xpath=//td[contains(text(),'${telg_name}')]//following-sibling::td//div[@class='dx-item-content dx-accordion-item-title']
${elg_type_checkbox}     xpath=//span[@class='dx-checkbox-text'][contains(text(),'${telg_type_checkbox}')]//preceding-sibling::span[@class='dx-checkbox-icon']
${elg_desc}      xpath=//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//textarea
#${elg_sort_order}
${elg_popup_cancel_btn}     xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Cancel']//span[contains(text(),'Cancel')]
${elg_popup_add_btn}        xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader']//div[@aria-label='Add']//span[contains(text(),'Add')]


#Data Classifications
${data_classfn}     xpath=//span[contains(text(),'Data Classifications')]
${assignedto_dataclassfn_checkbox}      xpath=//tr//td[contains(text(),'${tprgm_classfn_cat}')]//following-sibling::td//span[@class='dx-checkbox-icon']


#Delete
${prog_del_btn}     xpath=//td[contains(text(),'${ttif_program_name}')]//following-sibling::td//button[@class='btn btn-danger']
${prog_del_confirm_btn}     xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***

ProgramManagement: Admin Creates New Program
    [Documentation]    Creates a new Program.

    Find And Click Element    ${create_new_btn}
    Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View    ${program_name}
    Input Text for New Fields    ${program_name}    ${ttif_program_name}
    Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View    ${newprogram_type_dd}
    Find And Click Element    ${new_program_type_dd}
    Wait Until Page Contains Element    ${program_type_tif_option}      20
    Find And Click Element    ${program_type_tif_option}
    Find And Click Element    ${program_add_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}       20
    Wait Until Page Contains Element    ${program_name_text_in_programs}       20

ProgramManagement: Admin edits newly created Program
    [Documentation]    edits a new Program.

    Wait Until Page Contains Element    ${edit_btn}      120
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View    ${edit_btn}
    Find And Click Element    ${edit_btn}


ProgramManagement: Admin adds General Information to Program
    [Documentation]    Adds general information to a Program.

    Find And Click Element    ${general_info}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Element Is Visible    ${existing_shrt_description_ele}       20
    Wait Until Element Is Visible    ${gen_info_active_proj_toggle}       20
    Input Text for New Fields   ${strt_dt}    ${tstrt_dt}
    Input Text for New Fields   ${end_dt}    ${tend_dt}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Clear And Type Into Element    ${shrt_description}    ${tshrt_description_text}
    Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View    ${description}
    Wait Until Element Is Visible    ${description}     30
    Clear And Type Into Element    ${description}    ${tdescription_text}
    Clear And Type Into Element    ${cont_info}    ${tcont_info_text}
#    Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View  ${allow_business_applicants}
#    Find And Click Element    ${allow_business_applicants}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${gen_info_active_proj_toggle}
#    Hover Mouse    ${gen_info_active_proj_toggle}
#    Find And Click Element    ${gen_info_active_proj_toggle}
#    Hover Mouse    ${gen_info_active_toggle_yes_btn}
#    Find And Click Element    ${gen_info_active_toggle_yes_btn}
    Wait Until Page Contains Element    ${general_info_save_btn}
#    Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View  ${strt_dt}
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     2min        2secs       Scroll Element Into View    ${general_info_save_btn}
    Find And Click Element    ${general_info_save_btn}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${added_success_msg}       20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin adds Policies to Program
    [Documentation]    Adds policies to a Program.
    [Arguments]     ${tpolicy_name}       ${tpolicy_desc}

    Run Keyword And Ignore Error    Scroll Element Into View  ${policies_and_procedures}
    Find And Click Element    ${policies_and_procedures}        validate_elementvisible=${policies_header}
    Find And Click Element    ${add_policy_btn}
    Wait Until Page Contains Element    ${divpopup}      60
    Wait Until Element Is Visible    ${divpopup}      60
    Input Text for New Fields   ${policy_name}    ${tpolicy_name}
    Input Text for New Fields   ${policy_desc}    ${tpolicy_desc}
    Find And Click Element    ${policy_popup_add_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin adds application steps to Program
    [Documentation]    Adds application steps to a Program.
    [Arguments]     ${tapplication_step_name}

    Run Keyword And Ignore Error    Scroll Element Into View    ${program_name_header}
    Run Keyword And Ignore Error    Scroll Element Into View    ${application_steps}
    Find And Click Element    ${application_steps}        validate_elementvisible=${app_steps_header}
    Wait Until Page Contains Element    xpath=//div[@class='fw-bold'][contains(text(),'${tapplication_step_name}')]//ancestor::div[@class='row g-2']//*[local-name()='svg' and @data-icon='plus']        30
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//div[@class='fw-bold'][contains(text(),'${tapplication_step_name}')]//ancestor::div[@class='row g-2']//*[local-name()='svg' and @data-icon='plus']
    Find And Click Element    xpath=//div[@class='fw-bold'][contains(text(),'${tapplication_step_name}')]//ancestor::div[@class='row g-2']//*[local-name()='svg' and @data-icon='plus']
#    Wait Until Page Contains Element    ${divpopup}      60
#    Wait Until Element Is Visible    ${divpopup}      60
#    Wait Until Element Is Not Visible    ${loader_icon}     20
#    Input Text for New Fields       ${application_step_name}    ${tapplication_step_name}
#    Wait Until Page Contains Element    ${program_type_dd}     20
#    Wait Until Keyword Succeeds       2min        5sec        Scroll Element Into View  ${program_type_dd}
#    Hover Mouse    ${program_type_dd}
#    Find And Click Element    ${program_type_dd}
#    Wait Until Page Contains Element    xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprogram_type}')]     20
#    Run Keyword And Ignore Error    Scroll Element Into View  xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprogram_type}')]
#    Find And Click Element    ${program_type_dd}
#    Hover Mouse    xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprogram_type}')]
#    Find And Click Element    xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tprogram_type}')]
#    Hover Mouse    ${applicationstep_popup_add_btn}
#    Find And Click Element    ${applicationstep_popup_add_btn}
    Wait Until Element Is Visible      ${added_success_msg}     20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin edits Applicant Info to Program
    [Documentation]    Edits applicant info of a Program.



    Find And Click Element      ${appl_info}        validate_elementvisible=${appl_info_header}
    Hover Mouse    ${accepting_applications_togg}
    Find And Click Element    ${accepting_applications_togg}
    Find And Click Element    ${target_aud_dd}
    Find And Click Element    ${target_aud_option}
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_info_save_btn}
    Find And Click Element    ${appl_info_save_btn}
    Wait Until Element Is Visible      ${added_success_msg}     20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin views notification settings of Program
    [Documentation]    Views notification settings of a Program.

    Find And Click Element    ${notification_settings}        validate_elementvisible=${notifications_header}
    Find And Click Element    ${notification_event_type_view}

ProgramManagement: Admin adds required party info to Program
    [Documentation]    Adds required party info to a Program.

    Hover Mouse    ${application_steps}
    Find And Click Element    ${application_steps}
    Find And Click Element    ${req_party_info}        validate_elementvisible=${req_party_info_header}
    Find And Click Element    ${add_party_btn}
    Wait Until Page Contains Element    ${divpopup}      60
    Wait Until Element Is Visible    ${divpopup}      60
    Wait Until Page Contains Element    ${party_name}       60
    Wait Until Element Is Visible    ${party_name}       60
    Input Text for New Fields        ${party_name}    ${tparty_name}
    Hover Mouse    ${profile_type}
    Find And Click Element    ${profile_type}
    Wait Until Element Is Visible    ${profile_type_opt1}      30
    Find And Click Element    ${profile_type_opt1}
    Find And Click Element    ${party_popup_add_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin assigns districts to Program
    [Documentation]    Assigns districts to a Program.

    Find And Click Element    ${districts}        validate_elementvisible=${districts_header}
    Wait Until Page Contains Element    ${assigned_to_prog_checkbox}    60
    Find And Click Element    ${assigned_to_prog_checkbox}      validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin adds funding sources to Program
    [Documentation]    Adds funding sources to a Program.
    
    Run Keyword And Ignore Error    Scroll Element Into View    ${program_name_header}
    Find And Click Element    ${application_steps}
    Find And Click Element    ${funding_sources}        validate_elementvisible=${funding_sources_header}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Element Is Visible    ${subsidytypes_select}
    Find And Click Element    ${subsidytypes_select}
    Find And Click Element    ${property_tax_sub_type}
    Find And Click Element    ${none_specified_checkbox}
    Find And Click Element    ${add_fund_cat_btn}
    Wait Until Page Contains Element    ${divpopup}      60
    Wait Until Element Is Visible    ${divpopup}      60
    Wait Until Page Contains Element    ${funding_sources_popup_header}        60
    Wait Until Element Is Visible    ${fund_name}        60
    Wait Until Element Is Enabled    ${fund_name}        60
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Input Text for New Fields    ${fund_name}    ${tfund_name}
    Wait Until Page Contains Element    ${fund_desc}        120
    Wait Until Element Is Enabled    ${fund_desc}       20
    Input Text for New Fields    ${fund_desc}    ${tfund_desc}
    Find And Click Element    ${fund_popup_add_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${fund_add_categories_btn}     10
    Find And Click Element    ${fund_add_categories_btn}
    Wait Until Page Contains Element    ${fund_cat_name}        60
    Input Text for New Fields    ${fund_cat_name}    ${tfund_cat_name}
    Find And Click Element    ${add_fundtocat_popup_add_btn}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${added_success_msg}       20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin adds eligible costs to Program
    [Documentation]    Adds eligible costs to a Program.

    Run Keyword And Ignore Error    Scroll Element Into View    ${program_name_header}
    Find And Click Element    ${application_steps}
    Find And Click Element    ${eg_costs}       validate_elementvisible=${ec_header}
    Wait Until Element Is Visible    ${add_ec_cat_btn}
    Find And Click Element    ${add_ec_cat_btn}
    Wait Until Page Contains Element    ${divpopup}      60
    Wait Until Element Is Visible    ${divpopup}      60
    Wait Until Page Contains Element    ${ec_popup_header}      60
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Input Text for New Fields    ${ec_name}    ${tec_name}
    Input Text for New Fields    ${ec_desc}    ${tec_desc}
    Find And Click Element    ${ec_add_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Page Contains Element    ${ec_add_categories_btn}        30
    Run Keyword And Ignore Error    Scroll Element Into View    ${ec_add_categories_btn}
    Find And Click Element    ${ec_add_categories_btn}
    Wait Until Page Contains Element    ${ec_categories_name}       60
    Clear And Type Into Element    ${ec_categories_name}    ${tec_categories_name}
    Find And Click Element    ${ec_categories_popup_add_btn}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${added_success_msg}       20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin adds eligible construction activity to Program
    [Documentation]    Adds eligible construction activity to a Program.


    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     2min        2secs       Scroll Element Into View    ${program_name_header}
    Find And Click Element    ${application_steps}
    Wait Until Page Contains Element    ${elg_cons_act}
    Find And Click Element    ${elg_cons_act}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Find And Click Element    ${add_elig_cons_cat_btn}
    Wait Until Page Contains Element    ${elig_const_act_popup_header}     60
    Wait Until Page Contains Element    ${elg_name}     60
    Wait Until Element Is Not Visible    ${loader_icon}     10
    Input Text for New Fields    ${elg_name}    ${telg_name}
    Hover Mouse    ${elg_type_dd}
    Find And Click Element    ${elg_type_dd}
    Find And Click Element    ${elg_type_option}
    Input Text for New Fields    ${elg_desc}    ${telg_desc}
#    Find And Click Element    ${elg_popup_add_btn}
    Find And Click Element    ${elg_popup_add_btn}      validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}
    Find And Click Element    ${elg_type_accordion}
    Wait Until Element Is Visible    ${elg_type_checkbox}       5
    Find And Click Element    ${elg_type_checkbox}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${added_success_msg}       20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin adds data classifications to Program
    [Documentation]    Adds data classifications to Program.

    Find And Click Element    ${data_classfn}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${assignedto_dataclassfn_checkbox}      60
    Find And Click Element    ${assignedto_dataclassfn_checkbox}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${added_success_msg}       20
    Wait Until Element Is Not Visible    ${added_success_msg}       20

ProgramManagement: Admin deletes Program
    [Documentation]    Deletes a Program.

    Wait Until Page Contains Element    ${prog_del_btn}      120
    Wait Until Keyword Succeeds     2min        2secs        Scroll Element Into View    ${prog_del_btn}
    Find And Click Element    ${prog_del_btn}
    Hover Mouse    ${prog_del_confirm_btn}
    Find And Click Element    ${prog_del_confirm_btn}        validate_elementvisible=${deleted_success_msg}
    Wait Until Element Is Not Visible    ${deleted_success_msg}       20
    Wait Until Element Is Not Visible    ${program_name_text_in_programs}       20


