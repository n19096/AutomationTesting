*** Settings ***
Documentation    This file contians page objects for projects page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot
Resource    admin_homepage.robot

*** Variables ***

${tif_program_name_in_list}     xpath=//td[contains(text(),'${tappl_prog_name}')]
${tif_program_view_icon}     xpath=//td[contains(text(),'${tappl_prog_name}')]//following-sibling::td//div[@class='edit-delete-actions']//a//*[local-name()='svg' and @data-icon='arrow-right']
${tif_projects_header}     xpath=//h3[contains(text(),'Projects')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${prj_page_cnt_ele}      xpath=//div[@class='dx-page-indexes']
${prj_page_cnt}              xpath=//div[@class='dx-pages-count']
${prj_nxt_pg}              xpath=//div[@aria-label='Next Page']

*** Keywords ***


TIFDashboard: Navigate to Projects from TIF Program dashbaord
    [Documentation]    Navigates to projects from tif program dashboard.

    Wait Until Page Contains Element    ${tif_program_view_icon}        20
    Run Keyword And Ignore Error    Scroll Element Into View    ${tif_projects_header}
    Run Keyword And Ignore Error    Scroll Element Into View    ${tif_program_view_icon}
    Find And Click Element    ${tif_program_view_icon}
    Wait Until Page Does Not Contain Element    ${tif_program_view_icon}        30

TIFProjects: Navigate through pages to validate presence of project
    [Documentation]    Move through pages to validate presence of project
    [Arguments]     ${proj_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Page Contains Element    ${prj_page_cnt_ele}     30
    Wait Until Element Is Visible    ${prj_page_cnt_ele}        30
    Wait Until Page Contains Element    ${prj_page_cnt}        30
    Wait Until Element Is Visible    ${prj_page_cnt}       30
    ${page_cnt} =   Get Text    ${prj_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   xpath=//td//p[contains(text(),'${proj_name}')][1]
    WHILE    ${page_cnt} != 1 and ${Result} != 'True'
#      FOR    ${counter}    IN RANGE    1    ${page_cnt}    1
            Find And Click Element     ${prj_nxt_pg}
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            Wait Until Element Is Not Visible       ${loader_icon}      30
            Wait Until Page Contains Element    xpath=//td//p
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//td//p[contains(text(),'${proj_name}')][1]
#      END
    END
    Page Should Contain Element       xpath=//td//p[text()[contains(.,'${proj_name}')]]