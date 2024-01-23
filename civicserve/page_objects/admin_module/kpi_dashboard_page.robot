*** Settings ***
Documentation    This file contians page objects for compliances dashboard page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***
${kpi_btn}     xpath=//a[contains(text(),'Key Performance Indicators')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']

*** Keywords ***

KPI Dashboard: Go to KPI Page
    [Documentation]    admin goes to kpi

    Wait Until Element Is Visible    ${kpi_btn}      20
    Hover Mouse    ${kpi_btn}
    Find And Click Element    ${kpi_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60