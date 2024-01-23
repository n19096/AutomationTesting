*** Settings ***
Documentation    This file contians page objects for contacts(people) page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot

Library    SeleniumLibrary

*** Variables ***
#
${con_table_panel_ele}       xpath=//div[@class='panel contacts-table']
${create_btn}       xpath=//span[text()[contains(., 'Create New')]]
#//a[@href='/admin/contacts/people/add']
${create_people_option}       xpath=//div[@class='dx-item-content dx-list-item-content'][text()[contains(., 'People')]]
${first_name}       xpath=//input[@name='firstName']
${last_name}        xpath=//input[@name='lastName']
${tags}         xpath=//select[@name='tagsAsList']//parent::div//input
${existing_tag}     xpath=//div[@class='dx-tag-content']//span
${email}        xpath=//input[@name='email']
${cont_addr}        xpath=//input[@name='address']
${cont_phno}        xpath=//span[contains(text(),'Phone Number:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${submit_btn}       xpath=//span[contains(text(),'Submit')]
${div_panel_ele}       xpath=//div[@class='panel']
${div_form_ele}       xpath=//div[@role='form']
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]
${cont_phno_vis}        xpath=//input[@value='${tcon_phnno}']
${search_textbx}        xpath=//input[@aria-label='Search in the data grid']
${cont_edit_btn}     xpath=//td//span[contains(text(),'${tfirst_name}')]//ancestor::td//following-sibling::td//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']|//td[contains(text(),'${tfirst_name}')]//following-sibling::td//button[@class='btn btn-info']//*[local-name()='svg' and @data-icon='pen-to-square']
${first_cont_edit_btn}     xpath=//button[@class='btn btn-info'][1]
${con_page_cnt}              xpath=//div[@class='dx-pages-count']
${con_nxt_pg}              xpath=//div[@aria-label='Next Page']
${all_con_checkbox}       xpath=//div[contains(text(),'First Name')]//ancestor::td//preceding-sibling::td
${con_checkbox}       xpath=//td//span[contains(text(),'${tfirst_name}')]//ancestor::td//preceding-sibling::td//span[@class='dx-checkbox-icon']|//td[contains(text(),'${tfirst_name}')]//preceding-sibling::td//span[@class='dx-checkbox-icon']
${send_email_btn}       xpath=//button[text()[contains(., 'Send Email')]]
${con_email_temp}       xpath=//span[contains(text(),'Email Template:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${con_email_temp_opt}       xpath=//div[contains(text(),'Project Opened')]
${con_email_temp_opt1}       xpath=//div[contains(text(),'${tcon_temp_name}')]
${con_sub}          xpath=//input[@name='subject']
${con_heading}      xpath=//input[@name='heading']
${con_body}         xpath=//span[contains(text(),'Body:')]//ancestor::label//following-sibling::div//p
${con_popup_send_email_btn}     xpath=//span[contains(text(),'Send Email')]
#//span[contains(text(),'Send Email')]//ancestor::div[@role='button']
#//span[contains(text(),'Send Email')]
${con_delete_btn}       xpath=//td//span[contains(text(),'${tfirst_name}')]//ancestor::td//following-sibling::td//button[@title='Delete']|//td[contains(text(),'${tfirst_name}')]//following-sibling::td//button[@title='Delete']
${popup_del_btn}        xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]
*** Keywords ***

Contacts: Create a new Contact
    [Documentation]    admin creates a new contact

    Wait Until Page Contains Element    ${con_table_panel_ele}
    Wait Until Element Is Visible    ${con_table_panel_ele}     30
    Wait Until Element Is Visible    ${create_btn}      20
    Hover Mouse    ${create_btn}
    Find And Click Element    ${create_btn}
    Wait Until Element Is Visible    ${create_people_option}
    Hover Mouse    ${create_people_option}
    Find And Click Element    ${create_people_option}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    ${first_name}      60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Input Text for New Fields       ${first_name}    ${tfirst_name}
    Input Text for New Fields       ${last_name}    ${tlast_name}
    Input Text for New Fields       ${tags}    ${ttags}
    Press Keys           ${tags}        RETURN
    Input Text for New Fields       ${email}    ${tcon_email}
    Input Text for New Fields       ${cont_phno}    ${tcon_phnno}
    Find And Click Element    ${submit_btn}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible       ${added_success_msg}        60
    Wait Until Element Is Not Visible       ${added_success_msg}        60

Contacts: Go through the pages for specific contact
    [Documentation]    Admin goes through the pages for a specific contact.
    [Arguments]     ${con_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
#    Wait Until Page Contains Element        ${first_cont_edit_btn}
    ${page_cnt} =   Get Text    ${con_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${con_name}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != 'True'
            Find And Click Element     ${con_nxt_pg}
            Wait Until Element Is Not Visible    ${loader_icon}     60
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   //td[contains(text(),'${con_name}')][1]
        END

Contacts: Search a Contact
    [Documentation]    admin searches a contact
    [Arguments]     ${con_name}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    ${search_textbx}
    Input Text for New Fields       ${search_textbx}        ${con_name}
    Press Keys    ${search_textbx}    ENTER

Contacts: Edit a Contact
    [Documentation]    admin edits a contact

    Wait Until Element Is Not Visible    ${loader_icon}     30
#    Wait Until Keyword Succeeds     0.01sec     10secs      Scroll Element Into View    ${cont_edit_btn}
    Wait Until Page Contains Element    ${cont_edit_btn}        30
    Run Keyword And Ignore Error    Scroll Element Into View    ${cont_edit_btn}
    Find And Click Element    ${cont_edit_btn}
    Wait Until Element Is Not Visible    ${div_panel_ele}       60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    ${div_form_ele}        60
    Wait Until Element Is Visible    ${submit_btn}      60
    Wait Until Element Contains    ${existing_tag}    ${ttags}      60
    Clear And Type Into Element    ${first_name}    ${tedit_first_name}
    Clear And Type Into Element    ${last_name}    ${tlast_name}
    Clear And Type Into Element    ${tags}    ${ttags}
    Press Keys           ${tags}        RETURN
    Clear And Type Into Element    ${email}    ${tcon_email}
    Clear And Type Into Element    ${cont_addr}    ${tcon_email}
    Clear And Type Into Element    ${cont_phno}    ${tcon_email}
    Find And Click Element    ${submit_btn}
#    validate_elementvisible=${added_success_msg}
    Wait Until Element Is Visible       ${added_success_msg}        60
    Wait Until Element Is Not Visible       ${added_success_msg}        60

Contacts: Send Email to a Contact
    [Documentation]    admin sends email to selected contact

    Wait Until Element Is Not Visible    ${loader_icon}     60
#    Wait Until Keyword Succeeds    1min        5sec     Javascript Scroll to Element    ${con_checkbox}
    Wait Until Page Contains Element    ${con_checkbox}     60
    Run Keyword And Ignore Error    Scroll Element Into View    ${con_checkbox}
    Find And Click Element    ${con_checkbox}
    Run Keyword And Ignore Error        Scroll Element Into View     ${send_email_btn}
    Find And Click Element    ${send_email_btn}
    Wait Until Element Is Visible    ${con_popup_send_email_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse     ${con_email_temp}
    Find And Click Element    ${con_email_temp}
    Find And Click Element    ${con_email_temp_opt1}
    Find And Click Element    ${con_popup_send_email_btn}
#     validate_elementvisible=${added_success_msg}
#    Wait Until Element Is Not Visible       ${added_success_msg}

Contacts: Send Custom Email to a Contact
    [Documentation]    admin sends custom email to selected contact

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${con_checkbox}
    Run Keyword And Ignore Error    Scroll Element Into View    ${con_checkbox}
    Find And Click Element    ${con_checkbox}
    Find And Click Element    ${send_email_btn}
    Clear And Type Into Element    ${con_sub}     ${tcon_sub}
    Clear And Type Into Element    ${con_heading}     ${tcon_heading}
    Clear And Type Into Element    ${con_body}    ${tcon_body}
    Find And Click Element    ${con_popup_send_email_btn}

Contacts: Delete a Contact
    [Documentation]    admin deletes a contact

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${con_delete_btn}
    Run Keyword And Ignore Error    Scroll Element Into View    ${con_delete_btn}
    Find And Click Element    ${con_delete_btn}
    Hover Mouse    ${popup_del_btn}
    Find And Click Element    ${popup_del_btn}
#    validate_elementvisible=${deleted_success_msg}
    Wait Until Element Is Visible       ${deleted_success_msg}      60
    Wait Until Element Is Not Visible       ${deleted_success_msg}      60