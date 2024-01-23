*** Settings ***
Documentation    This file contians page objects for compliances page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***

#Create a new compliance
${compl_header}     xpath=//h3[contains(text(),'Agreement Compliances')]
${compl_create_btn}       xpath=//button[contains(text(),'Create New')]
${create_compl_header}      xpath=//h3[contains(text(),'Create Agreement Compliance')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${no_loader_icon}      xpath=//div[@id='loader'][@style='display: none;']
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]

#add_agreement_obligation
${add_glob_agreement_title}      xpath=//label//span[contains(text(),'Title')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_glob_agreement_desc}       xpath=//label//span[contains(text(),'Description')]//ancestor::label//parent::div//following-sibling::div//textarea
${add_glob_agreement_clawback_prov}      xpath=//div[@class='dx-switch-off']
${add_glob_agreement_clawback_prov_val}      xpath=//div[@class='dx-switch-on'][contains(text(),'Yes')]
${add_glob_agreement_res_party_dd}      xpath=//label//span[contains(text(),'Responsible Party')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_glob_agreement_res_party_option_val_check}      xpath=//div[@class='dx-dropdowneditor-overlay dx-overlay dx-popup dx-widget dx-visibility-change-handler dx-selectbox-popup']
${add_glob_agreement_res_party_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tglob_agreement_responsible_party}')]
${add_glob_agreement_obl_typ_dd}      xpath=//label//span[contains(text(),'Obligation Type')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_glob_agreement_obl_typ_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tglob_agreement_obl_typ}')]
${add_glob_agreement_freq_type_dd}      xpath=//label//span[contains(text(),'Agreement Frequency Type')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_glob_agreement_freq_type_option}      xpath=//div[contains(text(),'${tglob_agreement_frequency}')]
${add_glob_agreement_freq_type_dd_value}      xpath=//input[@name='agreementFrequencyType'][@value='${tglob_agreement_frequency_value}']
${add_glob_agreement_prog_dd}      xpath=//label//span[text()[contains(., 'Incentive Programs')]]//ancestor::label//parent::div//div//input[@autocomplete='off']
${add_glob_agreement_prog_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tglob_prog}')]
${add_glob_agreement_submit_btn}     xpath=//span[contains(text(),'Submit')]

#Search
${compl_search_txt}     xpath=//input[@aria-label='Search in the data grid']

#Edit
${compl_edit_btn}        xpath=//span[contains(text(),'${tglob_agreement_title}')]//parent::td//parent::tr//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
${edit_compl_header}      xpath=//h3[contains(text(),'Edit Agreement Compliance')]
${edit_glob_agreement_prog_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tglob_edit_prog}')]
${compl_page_cnt}              xpath=//div[@class='dx-pages-count']
${compl_nxt_pg}              xpath=//div[@aria-label='Next Page']

#Delete
${compl_del_btn}       xpath=//td[contains(text(),'${tglob_edit_agreement_title}')]//parent::tr//button[@class='btn btn-danger']
${compl_confirm_del_btn}     xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***

Compliance: Create a Global Compliance
    [Documentation]    admin creates global agreement compliance

    Wait Until Element Is Visible    ${compl_header}        30
    Wait Until Element Is Visible    ${compl_create_btn}      20
    Hover Mouse    ${compl_create_btn}
    Find And Click Element    ${compl_create_btn}
    Wait Until Element Is Visible    ${create_compl_header}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Input Text for New Fields       ${add_glob_agreement_title}        ${tglob_agreement_title}
    Input Text for New Fields       ${add_glob_agreement_desc}        ${tglob_agreement_desc}
    Hover Mouse    ${add_glob_agreement_clawback_prov}
    Find And Click Element    ${add_glob_agreement_clawback_prov}
    Wait Until Element Is Visible    ${add_glob_agreement_clawback_prov_val}     10
    Wait Until Element Is Visible    ${add_glob_agreement_res_party_dd}     10
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${add_glob_agreement_res_party_dd}
    Find And Click Element    ${add_glob_agreement_res_party_dd}
    Find And Click Element    ${add_glob_agreement_res_party_option}
    Hover Mouse    ${add_glob_agreement_obl_typ_dd}
    Find And Click Element    ${add_glob_agreement_obl_typ_dd}
    Find And Click Element    ${add_glob_agreement_obl_typ_option}
    Hover Mouse    ${add_glob_agreement_freq_type_dd}
    Find And Click Element    ${add_glob_agreement_freq_type_dd}
    Find And Click Element    ${add_glob_agreement_freq_type_option}
    Wait Until Page Contains Element    ${add_glob_agreement_freq_type_dd_value}
    Hover Mouse    ${add_glob_agreement_prog_dd}
    Find And Click Element    ${add_glob_agreement_prog_dd}
    Find And Click Element    ${add_glob_agreement_prog_option}
    Find And Click Element    ${add_glob_agreement_prog_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${add_glob_agreement_submit_btn}
    Find And Click Element    ${add_glob_agreement_submit_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10

Compliance: Search a Global Compliance
    [Documentation]    admin searches global agreement compliance
    [Arguments]     ${tglob_agreement_title}

    Wait Until Element Is Visible    ${compl_search_txt}        30
    Input Text for New Fields    ${compl_search_txt}    ${tglob_agreement_title}
    Press Keys    ${compl_search_txt}      ENTER
    Wait Until Page Does Not Contain Element    ${loader_icon}      30

Compliance: Edit a Global Compliance
    [Documentation]    admin edits global agreement compliance

    Wait Until Element Is Visible    ${compl_edit_btn}      30
    Find And Click Element    ${compl_edit_btn}
    Wait Until Element Is Visible    ${edit_compl_header}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${add_glob_agreement_title}     30
    Wait Until Element Is Visible    ${add_glob_agreement_title}     30
    Clear And Type Into Element       ${add_glob_agreement_title}        ${tglob_edit_agreement_title}
    Find And Click Element    ${add_glob_agreement_clawback_prov}
    Hover Mouse    ${add_glob_agreement_prog_dd}
    Find And Click Element    ${add_glob_agreement_prog_dd}
    Find And Click Element    ${edit_glob_agreement_prog_option}
    Find And Click Element    ${add_glob_agreement_prog_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${add_glob_agreement_submit_btn}
    Find And Click Element    ${add_glob_agreement_submit_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10

Compliance: Delete a Global Compliance
    [Documentation]    admin deletes global agreement compliance

    Wait Until Element Is Visible    ${compl_del_btn}      30
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${compl_del_btn}
    Hover Mouse    ${compl_confirm_del_btn}
    Find And Click Element    ${compl_confirm_del_btn}
#    Wait Until Element Is Visible    ${deleted_success_msg}       10
#    Wait Until Element Is Not Visible    ${deleted_success_msg}       10
    Wait Until Element Is Not Visible    ${compl_del_btn}       60