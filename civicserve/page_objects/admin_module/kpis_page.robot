*** Settings ***
Documentation    This file contians page objects for kpis page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***

#Create a new kpi
${kpi_header}     xpath=//h3[contains(text(),'Key Performance Indicators')]
${kpi_create_btn}       xpath=//button[contains(text(),'Create New')]
${create_kpi_header}      xpath=//div[contains(text(),'Add KPI')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${no_loader_icon}      xpath=//div[@id='loader'][@style='display: none;']
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]

#add_agreement_obligation
${add_kpi_name}      xpath=//label//span[contains(text(),'Name')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_kpi_desc}       xpath=//label//span[contains(text(),'Description')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_kpi_prog_dd}      xpath=//label//span[text()[contains(., 'Incentive Programs')]]//ancestor::label//parent::div//div//input[@autocomplete='off']
${add_kpi_prog_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tkpi_prog}')]
${add_kpi_type_dd}      xpath=//label//span[text()[contains(., 'Type')]]//ancestor::label//parent::div//div//input[@autocomplete='off']
${add_kpi_type_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tkpi_type_option}')]
${add_kpi_save_btn}     xpath=//span[contains(text(),'Save')]

#Search
${kpi_search_txt}     xpath=//input[@aria-label='Search in the data grid']

#Edit
${kpi_edit_btn}        xpath=//span[contains(text(),'${tkpi_name}')]//ancestor::td//parent::tr//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
${edit_kpi_header}      xpath=//div[contains(text(),'Update KPI')]
${edit_kpi_prog_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tkpi_edit_prog}')]
${kpi_page_cnt}              xpath=//div[@class='dx-pages-count']
${kpi_nxt_pg}              xpath=//div[@aria-label='Next Page']

#Delete
${kpi_del_btn}       xpath=//td[contains(.,'${tedit_kpi_name}')]//parent::tr//button[@class='btn btn-danger']
${kpi_confirm_del_btn}     xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***

KPI: Create a KPI
    [Documentation]    admin creates kpi

    Wait Until Element Is Visible    ${kpi_header}        30
    Wait Until Element Is Visible    ${kpi_create_btn}      20
    Hover Mouse    ${kpi_create_btn}
    Find And Click Element    ${kpi_create_btn}
    Wait Until Element Is Visible    ${create_kpi_header}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Input Text for New Fields       ${add_kpi_name}        ${tkpi_name}
    Input Text for New Fields       ${add_kpi_desc}        ${tkpi_desc}
    Hover Mouse    ${add_kpi_prog_dd}
    Find And Click Element    ${add_kpi_prog_dd}
    Find And Click Element    ${add_kpi_prog_option}
    Find And Click Element    ${add_kpi_prog_dd}
    Hover Mouse    ${add_kpi_type_dd}
    Find And Click Element    ${add_kpi_type_dd}
    Find And Click Element    ${add_kpi_type_option}
    Find And Click Element    ${add_kpi_type_dd}
    Find And Click Element    ${add_kpi_save_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10

KPI: Search a kpi
    [Documentation]    admin searches kpi
    [Arguments]     ${tkpi_name}

    Wait Until Element Is Visible    ${kpi_search_txt}        30
    Input Text for New Fields    ${kpi_search_txt}    ${tkpi_name}
    Press Keys    ${kpi_search_txt}      ENTER
    Wait Until Page Does Not Contain Element    ${loader_icon}      30

KPI: Edit a KPI
    [Documentation]    admin edits kpi

    Wait Until Element Is Visible    ${kpi_edit_btn}      30
    Find And Click Element    ${kpi_edit_btn}
    Wait Until Element Is Visible    ${edit_kpi_header}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${add_kpi_name}     30
    Wait Until Element Is Visible    ${add_kpi_name}     30
    Clear And Type Into Element       ${add_kpi_name}        ${tedit_kpi_name}
    Hover Mouse    ${add_kpi_prog_dd}
    Find And Click Element    ${add_kpi_prog_dd}
    Find And Click Element    ${edit_kpi_prog_option}
    Find And Click Element    ${add_kpi_prog_dd}
    Run Keyword And Ignore Error    Scroll Element Into View    ${add_kpi_save_btn}
    Find And Click Element    ${add_kpi_save_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10

KPI: Delete a KPI
    [Documentation]    admin deletes kpi

    Wait Until Element Is Visible    ${kpi_del_btn}      30
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${kpi_del_btn}
    Hover Mouse    ${kpi_confirm_del_btn}
    Find And Click Element    ${kpi_confirm_del_btn}
    Wait Until Element Is Visible    ${deleted_success_msg}       10
    Wait Until Element Is Not Visible    ${deleted_success_msg}       10
#    Wait Until Element Is Not Visible    ${kpi_del_btn}       60