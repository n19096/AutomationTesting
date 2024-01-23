*** Settings ***
Documentation    This file contians page objects for compliances dashboard page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***
${agr_comp_btn}     xpath=//a[contains(text(),'Agreement Compliances')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']

*** Keywords ***

Compliance Dashboard: Go to Compliance Page
    [Documentation]    admin goes to compliance

    Wait Until Element Is Visible    ${agr_comp_btn}      20
    Hover Mouse    ${agr_comp_btn}
    Find And Click Element    ${agr_comp_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60