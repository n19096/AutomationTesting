*** Settings ***
Documentation    This file contians page objects for templates page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot
Resource    admin_homepage.robot

Library    SeleniumLibrary

*** Variables ***
#
${create_new_temp}       xpath=//button[@class='btn btn-primary btn-lg dropdown-toggle'][contains(text(),'Add Template')]
${email_temp_option}       xpath=//a[contains(text(),'Email Template')]
${temp_name}             xpath=//input[@name='name']
${temp_sub}              xpath=//input[@name='subject']
${temp_heading}          xpath=//input[@name='heading']
${temp_body}             xpath=//span[contains(text(),'Body:')]//ancestor::label//following-sibling::div//p
${temp_submit_btn}           xpath=//span[contains(text(),'Submit')]
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]
${temp_page_cnt}              xpath=//div[@class='dx-pages-count']
${temp_nxt_pg}              xpath=//div[@aria-label='Next Page']
${page_cnt}
${Result}
${search_textbx}        xpath=//input[@aria-label='Search in the data grid']
${temp_edit_btn}              xpath=//td//div[contains(text(),'${ttemp_name}')]//ancestor::td//following-sibling::td//div//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${templates_header_text}      xpath=//h3[contains(text(),'Email Templates')]
${temp_del_btn}              xpath=//td//div[contains(text(),'${tedit_temp_name}')]//ancestor::td//following-sibling::td//div//button[@class='btn btn-danger']
${temp_popup_del_btn}              xpath=//div[@class='dx-overlay-wrapper dx-popup-wrapper dx-overlay-shader'][2]//div[@role='button']//span[contains(text(),'Delete')]
#//ancestor::div[@role='button']
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***

Template: Create a new Template
    [Documentation]    Admin creates a new template.

    Find And Click Element     ${create_new_temp}
    Find And Click Element      ${email_temp_option}
    Clear And Type Into Element    ${temp_name}    ${ttemp_name}
    Clear And Type Into Element    ${temp_sub}    ${ttemp_sub}
    Clear And Type Into Element    ${temp_heading}    ${ttemp_heading}
    Clear And Type Into Element    ${temp_body}    ${ttemp_body}
    Find And Click Element    ${temp_submit_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}

Template: Go through the pages for specific template
    [Documentation]    Admin goes through the pages for a specific template.
    [Arguments]     ${temp_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    ${page_cnt} =   Get Text    ${temp_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${temp_name}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != 'True'
            Find And Click Element     ${temp_nxt_pg}
            Wait Until Element Is Not Visible    ${loader_icon}     30
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${temp_name}')][1]
        END
    Wait Until Page Contains Element    ${templates_header_text}
    Run Keyword And Ignore Error    Scroll Element Into View        ${templates_header_text}

Template: Search a template
    [Documentation]    admin searches a contact
    [Arguments]     ${temp_name}
    Wait Until Element Is Not Visible    ${loader_icon}
    Wait Until Element Is Visible    ${search_textbx}
    Input Text for New Fields       ${search_textbx}        ${temp_name}
    Press Keys    ${search_textbx}    ENTER

Template: Edit an existing Template
    [Documentation]    Admin edits existing template.

#    Wait Until Keyword Succeeds     2min        2secs    Javascript Scroll to Element    ${temp_edit_btn}
    Wait Until Page Contains Element    ${temp_edit_btn}
    Run Keyword And Ignore Error    Scroll Element Into View    ${temp_edit_btn}
    Find And Click Element     ${temp_edit_btn}
    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Element Contains    ${temp_body}    ${ttemp_body}       20
    Clear And Type Into Element    ${temp_name}    ${tedit_temp_name}
    Clear And Type Into Element    ${temp_sub}    ${ttemp_sub}
    Clear And Type Into Element    ${temp_heading}    ${ttemp_heading}
    Clear And Type Into Element    ${temp_body}    ${ttemp_body}
    Find And Click Element    ${temp_submit_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible    ${added_success_msg}

Template: Delete an existing Template
    [Documentation]    Admin deletes existing template.

    Run Keyword And Ignore Error    Scroll Element Into View     ${temp_del_btn}
    Wait Until Page Contains Element    ${temp_del_btn}
    Find And Click Element     ${temp_del_btn}
    Hover Mouse    ${temp_popup_del_btn}
    Find And Click Element    ${temp_popup_del_btn}        validate_elementvisible=${deleted_success_msg}
    Wait Until Element Is Not Visible    ${deleted_success_msg}


