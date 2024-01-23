*** Settings ***
Documentation    This file contians page objects for public user home page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot

*** Variables ***
${page_header_text}     xpath=//h3[contains(text(),'Project Timeline')]
${overview_tab}     xpath=//span[contains(text(),'Overview')]
${agreement_tab}     xpath=//span[contains(text(),'Agreement')]
${agreement_title_cell1}     xpath=//h3[contains(text(),'Agreement Obligations')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${agreement_res_party_cell1}     xpath=//h3[contains(text(),'Agreement Obligations')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]
${agreement_prov_cell1}     xpath=//h3[contains(text(),'Agreement Obligations')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]
${agreement_freq_cell1}     xpath=//h3[contains(text(),'Agreement Obligations')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[5]

${agreement_docname_cell1}     xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${agreement_agrmt_type_cell1}     xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]
${agreement_uploaded_dt_cell1}     xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]
${agreement_docname_cell2}     xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[2]//td[1]
${agreement_agrmt_type_cell2}     xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[2]//td[2]

${files_tab}     xpath=//span[contains(text(),'Files')]
${signatur_file_text}       xpath=//div[text()[contains(., 'Signature')]]
${applicant_filename}       xpath=//div[text()[contains(., '')]]

${files_filename_cell1}     xpath=//h3[contains(text(),'Applicant')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${files_uploaded_dt_cell1}     xpath=//h3[contains(text(),'Applicant')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]//span
${files_status_cell1}     xpath=//h3[contains(text(),'Applicant')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//div



*** Keywords ***

SubmittedApplicationPage: Validate Agreement obligation details submitted
    [Documentation]    validate agreement obligation details submitted

    Wait Until Page Contains Element    ${overview_tab}     30
    Run Keyword And Ignore Error    Scroll Element Into View    ${page_header_text}
    Run Keyword And Ignore Error    Scroll Element Into View    ${agreement_tab}
    Find And Click Element    ${agreement_tab}
    Compare Actual Element text and expected text    ${agreement_title_cell1}    ${tedit_agreement_title}
    Compare Actual Element text and expected text    ${agreement_res_party_cell1}    ${tagreement_responsible_party}
    Compare Actual Element text and expected text    ${agreement_prov_cell1}    ${tagreement_claw_back_provision}
    Compare Actual Element text and expected text    ${agreement_freq_cell1}    ${tagreement_frequency}

SubmittedApplicationPage: Validate Agreement document details submitted
    [Documentation]    validate agreement document details submitted

    Wait Until Page Contains Element    ${overview_tab}     30
    Run Keyword And Ignore Error    Scroll Element Into View    ${page_header_text}
    Run Keyword And Ignore Error    Scroll Element Into View    ${agreement_tab}
    Find And Click Element    ${agreement_tab}
    Compare Actual Element text and expected text    ${agreement_docname_cell1}    ${tagreement_doc_name}
    Compare Actual Element text and expected text    ${agreement_agrmt_type_cell1}    ${tagrmtcomp_type}
    ${tagrmt_dt}    Evaluate  '{dt.month}/{dt.day}/{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
    Compare Actual Element text and expected text    xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]    ${tagrmt_dt}
    Compare Actual Element text and expected text    ${agreement_docname_cell2}    ${tagreement_doc_name1}
    Compare Actual Element text and expected text    ${agreement_agrmt_type_cell2}    ${tagrmt_type1}

SubmittedApplicationPage: Validate Files details submitted
    [Documentation]    validate files details submitted

    Wait Until Page Contains Element    ${overview_tab}     30
    Run Keyword And Ignore Error    Scroll Element Into View    ${page_header_text}
    Run Keyword And Ignore Error    Scroll Element Into View    ${files_tab}
    Find And Click Element    ${files_tab}
    Wait Until Page Contains Element    ${signatur_file_text}   20
    Compare Actual Element text and expected text    ${files_filename_cell1}    ${tfile_appl_doc_name}
    ${tfile_uploaded_dt}    Evaluate  '{dt.month}/{dt.day}/{dt.year}'.format(dt=datetime.datetime.now())    modules=datetime
    Compare Actual Element text and expected text    xpath=//h3[contains(text(),'Applicant')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]//span    ${tfile_uploaded_dt}
    Compare Actual Element text and expected text    ${files_status_cell1}    ${tfile_status}