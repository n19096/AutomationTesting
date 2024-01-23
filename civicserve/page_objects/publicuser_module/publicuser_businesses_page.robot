*** Settings ***
Documentation    This file contians page objects for public user businesses page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***

#Create a new business
${create_buss_header}       xpath=//h3[contains(.,'Create') and contains(.,'Business')]
${buss_page_name}       xpath=//span[contains(text(),'Details')]//parent::div//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_email}        xpath=//span[contains(text(),'Details')]//parent::div//span[contains(text(),'Email:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_phn}         xpath=//span[contains(text(),'Details')]//parent::div//span[contains(text(),'Phone:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_fax}        xpath=//span[contains(text(),'Details')]//parent::div//span[contains(text(),'Fax:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_form_dt}       xpath=//span[contains(text(),'Details')]//parent::div//span[contains(text(),'Formation Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_website}       xpath=//span[contains(text(),'Details')]//parent::div//span[contains(text(),'Website:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_addr_line1}       xpath=//span[contains(text(),'Physical Address')]//parent::div//span[contains(text(),'Address Line 1:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_addr_line2}       xpath=//span[contains(text(),'Physical Address')]//parent::div//span[contains(text(),'Address Line 2:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_city}       xpath=//span[contains(text(),'Physical Address')]//parent::div//span[contains(text(),'City:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_state}       xpath=//span[contains(text(),'Physical Address')]//parent::div//span[contains(text(),'State:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_zip}       xpath=//span[contains(text(),'Physical Address')]//parent::div//span[contains(text(),'Zip:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_same_as_phy_addr}        xpath=//span[contains(text(),'Same as Physical Address')]
${buss_mail_addr_line1}       xpath=//span[contains(text(),'Mailing Address')]//parent::div//span[contains(text(),'Address Line 1:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_mail_addr_line2}       xpath=//span[contains(text(),'Mailing Address')]//parent::div//span[contains(text(),'Address Line 2:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_mail_city}       xpath=//span[contains(text(),'Mailing Address')]//parent::div//span[contains(text(),'City:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_mail_state}       xpath=//span[contains(text(),'Mailing Address')]//parent::div//span[contains(text(),'State:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_mail_zip}       xpath=//span[contains(text(),'Mailing Address')]//parent::div//span[contains(text(),'Zip:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_type_dd}          xpath=//span[contains(text(),'Type')]//parent::div//span[contains(text(),'Type:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_type_option}          xpath=//span[text()[contains(.,'${tappl_buss_type}')]]
${buss_size_dd}          xpath=//span[contains(text(),'Number of employees:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_size_option}          xpath=//div[contains(text(),'25-49')]
${buss_charter_dd}       xpath=//span[contains(text(),'Profile Questions')]//parent::div//span[contains(text(),'Business Charter:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_charter_option}       xpath=//div[contains(text(),'Foreign Entity - Other US State')]
${buss_lgl_form_type_dd}       xpath=//span[contains(text(),'Profile Questions')]//parent::div//span[contains(text(),'Legal Formation Type:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${buss_lgl_form_type_option}       xpath=//div[contains(text(),'Partnership')]
${buss_dt_of_fmtn}       xpath=//span[contains(text(),'Profile Questions')]//parent::div//span[contains(text(),'Date of Formation:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${submit_btn}       xpath=//span[contains(text(),'Submit')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]

${search_textbx}        xpath=//input[@aria-label='Search in the data grid']

#View
${buss_view_btn}        xpath=//td[contains(text(),'${tappl_vieworedit_buss_name}')]//parent::tr//button[@class='btn btn-info'][1]

#Edit
${appl_buss_edit_btn}        xpath=//td[contains(text(),'${tappl_newbuss_name}')]//parent::tr//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']

${appl_temp_page_cnt}              xpath=//h3[ contains(text(),'Your Businesses')]//ancestor::div[@class='panel developer-panel']//div[@class='dx-pages-count']
${appl_temp_nxt_pg}              xpath=//h3[ contains(text(),'Your Businesses')]//ancestor::div[@class='panel developer-panel']//div[@aria-label='Next Page']
${page_cnt}
${Result}

#Delete
${appl_buss_del_btn}       xpath=//td[contains(text(),'${teditappl_buss_name}')]//parent::tr//button[@class='btn btn-danger']
${appl_buss_confirm_del_btn}     xpath=//span[contains(text(),'Exit')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***


Applicant Businesses: Fill the Applicant Business Details
    [Documentation]    admin fills the business details
    [Arguments]     ${tnewbuss_name}

#    Run Keyword And Ignore Error        Scroll Element Into View    ${submit_btn}
#    Run Keyword And Ignore Error        Scroll Element Into View    ${buss_page_name}
    Wait Until Element Is Not Visible       ${loader_icon}      20
    Wait Until Element Is Visible    ${buss_page_name}      60
    Wait Until Element Is Not Visible       ${loader_icon}      20
    Run Keyword And Ignore Error        Scroll Element Into View    ${create_buss_header}
    Wait Until Element Is Not Visible       ${loader_icon}      20
    Clear And Type Into Element     ${buss_page_name}    ${tnewbuss_name}
    Wait Until Page Contains Element    ${buss_email}
    Wait Until Element Is Visible    ${buss_email}
    Set Selenium Implicit Wait    20
    Clear And Type Into Element    ${buss_email}    ${tappl_buss_email}
    Clear And Type Into Element    ${buss_phn}    ${tappl_buss_phn}
    Clear And Type Into Element    ${buss_fax}    ${tappl_buss_fax}
    Clear And Type Into Element     ${buss_form_dt}    ${tappl_buss_form_dt}
    Clear And Type Into Element    ${buss_website}    ${tappl_buss_website}
    Clear And Type Into Element    ${buss_addr_line1}    ${tappl_buss_addr_line1}
    Clear And Type Into Element    ${buss_addr_line2}    ${tappl_buss_addr_line2}
    Clear And Type Into Element     ${buss_city}    ${tappl_buss_city}
    Clear And Type Into Element    ${buss_state}    ${tappl_buss_state}
    Clear And Type Into Element    ${buss_zip}    ${tappl_buss_zip}
    Run Keyword And Ignore Error    Scroll Element Into View     ${buss_same_as_phy_addr}
    Find And Click Element    ${buss_same_as_phy_addr}
    Run Keyword And Ignore Error        Scroll Element Into View    ${submit_btn}
    Find And Click Element    ${buss_type_dd}
    Find And Click Element    ${buss_type_option}
    Find And Click Element    ${buss_size_dd}
    Find And Click Element    ${buss_size_option}
    Find And Click Element    ${buss_charter_dd}
    Find And Click Element    ${buss_charter_option}
    Find And Click Element    ${buss_lgl_form_type_dd}
    Find And Click Element    ${buss_lgl_form_type_option}
#    Clear And Type Into Element    ${buss_dt_of_fmtn}    ${tbuss_dt_of_fmtn}   --element not present
    Run Keyword And Ignore Error    Scroll Element Into View     ${submit_btn}
    Find And Click Element    ${submit_btn}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible    ${added_success_msg}       60

Applicant Businesses: Search applicant Business
    [Documentation]    admin searches a business
    [Arguments]     ${buss_name}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Element Is Visible    ${search_textbx}
    Input Text for New Fields       ${search_textbx}        ${buss_name}
    Press Keys    ${search_textbx}    ENTER

Applicant Business: Go through the pages for specific business
    [Documentation]    Admin goes through the pages for a specific business.
    [Arguments]     ${tbuss_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Page Contains Element    ${appl_temp_page_cnt}    30
    ${page_cnt} =   Get Text    ${appl_temp_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${tbuss_name}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != True
            Find And Click Element     ${appl_temp_nxt_pg}
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${tbuss_name}')][1]
        END

Applicant Businesses: Edit Applicant Created Business
    [Documentation]    admin edits created business

    Wait Until Page Contains Element    ${appl_buss_edit_btn}        20
    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_buss_edit_btn}
#    Wait Until Element Is Visible    ${appl_buss_edit_btn}        60
    Find And Click Element    ${appl_buss_edit_btn}

Applicant Businesses: Delete applicant Business
    [Documentation]    admin deletes existing business

#    Wait Until Page Contains Element    ${buss_del_btn}     20
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_buss_del_btn}
#    Wait Until Element Is Visible    ${buss_del_btn}        60
    Find And Click Element    ${appl_buss_del_btn}
    Hover Mouse    ${appl_buss_confirm_del_btn}
    Find And Click Element    ${appl_buss_confirm_del_btn}
    Wait Until Element Is Visible       ${deleted_success_msg}        20
    Wait Until Element Is Not Visible    ${deleted_success_msg}     20
