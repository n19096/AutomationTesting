*** Settings ***
Documentation    This file contians page objects for contacts(people) page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot

Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${email_hist_header}       xpath=//h3[contains(text(),'Email History')]
${email_hist_search}       xpath=//input[@aria-label='Search in the data grid']
${email_hist_sub_in_grid}      xpath=//div[@class='dx-datagrid-headers']//following-sibling::div//tr[1]//td[1][contains(text(),'${expected_sub}')]
${email_hist_recepient_in_grid}      xpath=//div[@class='dx-datagrid-headers']//following-sibling::div//tr[1]//td[2]//span[contains(text(),'test.civi')]
${email_hist_date_in_grid}      xpath=//div[@class='dx-datagrid-headers']//following-sibling::div//tr[1]//td[3]//div[contains(text())]
${email_hist_temp_in_grid}      xpath=//div[@class='dx-datagrid-headers']//following-sibling::div//tr[1]//td[5][contains(text(),'${tcon_temp_name}')]

*** Keywords ***

EmailHistory: Validate Email sent Is added in History
    [Documentation]    admin validates email sent is added in email history

    Wait Until Page Contains Element    ${email_hist_header}        30
    Input Text for New Fields    ${email_hist_search}    ${tgmail}
    Wait Until Page Contains Element    ${email_hist_sub_in_grid}        30
    Wait Until Page Contains Element    ${email_hist_recepient_in_grid}        30
    ${now1}    Evaluate  '{dt:%m}/{dt.day}/{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
#    ${now1}     Convert To String    ${now1}
    Wait Until Page Contains Element    xpath=//div[@class='dx-datagrid-headers']//following-sibling::div//tr[1]//td[3]//div[contains(text(),'${now1}')]      30
    Wait Until Page Contains Element    ${email_hist_temp_in_grid}        30
