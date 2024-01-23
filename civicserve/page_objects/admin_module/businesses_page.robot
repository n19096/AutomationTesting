*** Settings ***
Documentation    This file contians page objects for businesses page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot


*** Variables ***

#Create a new business
${buss_create_btn}       xpath=//span[contains(text(),'Create New')]
${create_buss_option}       xpath=//div[@class='dx-item-content dx-list-item-content'][text()[contains(., 'Businesses')]]
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
${buss_type_option}          xpath=//span[text()[contains(.,'${tbuss_type}')]]
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
${buss_view_btn}        xpath=//td[contains(text(),'${tvieworedit_buss_name}')]//parent::tr//button[@class='btn btn-info'][1]

#Edit
${buss_edit_btn}        xpath=//td[contains(text(),'${tnewbuss_name}')]//parent::tr//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']

${temp_page_cnt}              xpath=//div[@class='dx-pages-count']
${temp_nxt_pg}              xpath=//div[@aria-label='Next Page']
${page_cnt}
${Result}

#Delete
${buss_del_btn}       xpath=//td[contains(text(),'${teditbuss_name}')]//parent::tr//button[@class='btn btn-danger']
${buss_confirm_del_btn}     xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]

*** Keywords ***

Businesses: Create a Business
    [Documentation]    admin creates business

#    Find And Click Element    ${buss_create_btn}
    Wait Until Element Is Visible    ${buss_create_btn}      20
    Hover Mouse    ${buss_create_btn}
    Find And Click Element    ${buss_create_btn}
    Wait Until Element Is Visible    ${create_buss_option}
    Hover Mouse    ${create_buss_option}
    Find And Click Element    ${create_buss_option}
    Wait Until Element Is Not Visible    ${loader_icon}     60

Businesses: Fill the Business Details
    [Documentation]    admin fills the business details
    [Arguments]     ${tnewbuss_name}

#    Run Keyword And Ignore Error        Scroll Element Into View    ${submit_btn}
#    Run Keyword And Ignore Error        Scroll Element Into View    ${buss_page_name}
#    Wait Until Element Is Visible    ${buss_page_name}
    Wait Until Element Is Not Visible       ${loader_icon}      60
    Clear And Type Into Element     ${buss_page_name}    ${tnewbuss_name}
    Wait Until Page Contains Element    ${buss_email}
    Wait Until Element Is Visible    ${buss_email}
    Set Selenium Implicit Wait    60
    Clear And Type Into Element    ${buss_email}    ${tbuss_email}
    Clear And Type Into Element    ${buss_phn}    ${tbuss_phn}
    Clear And Type Into Element    ${buss_fax}    ${tbuss_fax}
    Clear And Type Into Element     ${buss_form_dt}    ${tbuss_form_dt}
    Clear And Type Into Element    ${buss_website}    ${tbuss_website}
    Clear And Type Into Element    ${buss_addr_line1}    ${tbuss_addr_line1}
    Clear And Type Into Element    ${buss_addr_line2}    ${tbuss_addr_line2}
    Clear And Type Into Element     ${buss_city}    ${tbuss_city}
    Clear And Type Into Element    ${buss_state}    ${tbuss_state}
    Clear And Type Into Element    ${buss_zip}    ${tbuss_zip}
    Run Keyword And Ignore Error    Scroll Element Into View     ${buss_same_as_phy_addr}
    Find And Click Element    ${buss_same_as_phy_addr}
    Find And Click Element    ${buss_type_dd}
#    Run Keyword And Ignore Error        Scroll Element Into View    ${buss_type_option}
    Find And Click Element    ${buss_type_option}
    Find And Click Element    ${buss_size_dd}
    Find And Click Element    ${buss_size_option}
    Find And Click Element    ${buss_charter_dd}
    Find And Click Element    ${buss_charter_option}
    Find And Click Element    ${buss_lgl_form_type_dd}
    Find And Click Element    ${buss_lgl_form_type_option}
#    Clear And Type Into Element    ${buss_dt_of_fmtn}    ${tbuss_dt_of_fmtn}   --element not present
    Run Keyword And Ignore Error    Scroll Element Into View     ${submit_btn}
    Find And Click Element    ${submit_btn}        validate_elementvisible=${added_success_msg}

Businesses: Search a Business
    [Documentation]    admin searches a business
    [Arguments]     ${buss_name}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    ${search_textbx}
    Input Text for New Fields       ${search_textbx}        ${buss_name}
    Press Keys    ${search_textbx}    ENTER

Business: Validate presence of Business
    [Documentation]    Admin goes through the pages for a specific business.
    [Arguments]     ${tbuss_name}

    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element    //span[contains(text(),'${tbuss_name}')][1]       60
    Page Should Contain Element    //span[contains(text(),'${tbuss_name}')][1]

Business: Validate deletion of Business
    [Documentation]    Admin goes through the pages for a specific business.
    [Arguments]     ${tbuss_name}

    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Run Keyword And Ignore Error        Wait Until Page Contains Element    //td[contains(text(),'${tbuss_name}')][1]       60
    Page Should Not Contain Element    //td[contains(text(),'${tbuss_name}')][1]

Business: Go through the pages for specific business
    [Documentation]    Admin goes through the pages for a specific business.
    [Arguments]     ${tbuss_name}

    Wait Until Element Is Not Visible       ${loader_icon}      60
    ${page_cnt} =   Get Text    ${temp_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${tbuss_name}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != True
            Find And Click Element     ${temp_nxt_pg}
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${tbuss_name}')][1]
        END


Businesses: Edit Created Business
    [Documentation]    admin edits created business

    Wait Until Page Contains Element    ${buss_edit_btn}        60
    Run Keyword And Ignore Error    Scroll Element Into View     ${buss_edit_btn}
#    Wait Until Element Is Visible    ${buss_edit_btn}        60
    Find And Click Element    ${buss_edit_btn}

Businesses: Delete a Business
    [Documentation]    admin deletes existing business

    Wait Until Page Contains Element    ${buss_del_btn}     20
    Run Keyword And Ignore Error    Scroll Element Into View    ${buss_del_btn}
#    Wait Until Element Is Visible    ${buss_del_btn}        60
    Find And Click Element    ${buss_del_btn}
    Hover Mouse    ${buss_confirm_del_btn}
    Find And Click Element    ${buss_confirm_del_btn}
#    validate_elementvisible=${deleted_success_msg}
    Wait Until Element Is Visible       ${deleted_success_msg}        60
    Wait Until Element Is Not Visible    ${deleted_success_msg}     60
