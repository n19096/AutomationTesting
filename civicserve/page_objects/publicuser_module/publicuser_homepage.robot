*** Settings ***
Documentation    This file contians page objects for public user home page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot
Library    SeleniumLibrary

*** Variables ***
# InterestedIn
${developer}     xpath=//i[@data-autotest='']
${business}     xpath=//i[@data-autotest='']
${resident}     xpath=//i[@data-autotest='']
${consultant}     xpath=//i[@data-autotest='']

# Header
${developerpage_header}     xpath=//h1[@data-autotest='']
${businesspage_header}     xpath=//h1[@data-autotest='']

# Dropdown Menu
${applications_and_account_option}     xpath=//a[@data-autotest='']
${businesses_option}     xpath=//a[@data-autotest='']
${settings_option}     xpath=//a[@data-autotest='']
${logout_option}     xpath=//a[@data-autotest='']

# Header
${application_history_tab}     xpath=//a[@data-autotest='']
${activetab_checker}     xpath=//a[@aria-expanded='true']
${businesses_tab}     xpath=//a[@data-autotest='']
${account_and_communication_tab}     xpath=//a[@data-autotest='']


#
${application_new_btn}     xpath=//a[contains(text(),'New')]
${application_incentive_label}     xpath=//label[text()[contains(., 'Incentive (0)')]]
${incentive_programs_showmore_btn}     xpath=//div[contains(@id,'Incentive')][not(contains(@id,'Non'))]//button[text()[contains(., 'Show')]][1]
${incentive_programs_no_showmore_btn}     xpath=//div[contains(@id,'Incentive')][not(contains(@id,'Non'))]//button[text()[contains(., 'Show')]][1][@style='display: none;']
${appl_program_name}     xpath=//strong[contains(text(),'${tappl_prog_name}')]
#//ancestor::a[@class='cs-product-card']
#//strong[contains(text(),'${tappl_prog_name1}')]
${dev_loggedin_profile}         xpath=//button[@id='login-btn']//span[contains(text(),'${test_exp_profile_name}')]
${portal_button}         xpath=//a[contains(text(),'Portal')]
${appl_project_name}        xpath=//td//b[contains(text(),'${tproj_name}')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${page_cnt_ele}      xpath=//h3[ contains(text(),'Your Applications')]//ancestor::div[@class='panel developer-panel']//div[@class='dx-page-indexes']
${proj_page_cnt}              xpath=//h3[ contains(text(),'Your Applications')]//ancestor::div[@class='panel developer-panel']//div[@class='dx-pages-count']
${proj_nxt_pg}              xpath=//h3[ contains(text(),'Your Applications')]//ancestor::div[@class='panel developer-panel']//div[@aria-label='Next Page']
${portal_header}        xpath=//div[contains(text(),'Economic Development Portal')]
${applications_header}      xpath=//h3[contains(text(),'Your Applications')]
${view_btn}      xpath=//td//b[contains(text(),'${tproj_name}')]//ancestor::tr//td//a//button[contains(text(),'View')]
${resume_btn}      xpath=//b[text()[contains(., '${tproj_name}')]]//preceding-sibling::small[contains(text(),'${tincentive_program}')]//ancestor::tr//td//a//button[contains(text(),'Resume')]//parent::a
#//tbody[@role='presentation']//td//b[contains(text(),'${tproj_name}')]//ancestor::tr//td//a//button[contains(text(),'Resume')]//parent::a
${buss_list_header}     xpath=//h3[contains(.,'Your Businesses')]
${buss_add_btn}     xpath=//a[contains(text(),'Add')]//*[local-name()='svg' and @data-icon='plus']
${buss_page_cnt_ele}      xpath=//h3[ contains(text(),'Your Businesses')]//ancestor::div[@class='panel developer-panel']//div[@class='dx-page-indexes']
${buss_page_cnt}              xpath=//h3[ contains(text(),'Your Businesses')]//ancestor::div[@class='panel developer-panel']//div[@class='dx-pages-count']
${buss_nxt_pg}              xpath=//h3[ contains(text(),'Your Businesses')]//ancestor::div[@class='panel developer-panel']//div[@aria-label='Next Page']
${buss_pgno_ip}              xpath=//h3[ contains(text(),'Your Businesses')]//ancestor::div[@class='panel developer-panel']//div[@class='dx-light-pages']//input[@autocomplete='off']
${search_txtbx}     xpath=//input[@aria-label='Search in the data grid']
*** Keywords ***

UserHome: User on Programs Page 
    [Documentation]    Navigates to new application page

    Find And Click Element    ${application_new_btn}
    Wait Until Element Is Not Visible    ${application_incentive_label}     30
    Find And Click Element    ${incentive_programs_showmore_btn}
    Wait Until Page Contains Element    ${incentive_programs_no_showmore_btn}        30
    
UserHome: Validate presence of program
    [Arguments]     ${program_name}

    Wait Until Page Contains Element    xpath=//strong[contains(text(),'${program_name}')]     30
    Page Should Contain Element    xpath=//strong[contains(text(),'${program_name}')]
    
UserHome: Validate no program
    [Arguments]     ${program_name}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Page Should Not Contain Element    xpath=//strong[contains(text(),'${program_name}')]

UserHome: User on New Application Page
    [Documentation]    Navigates to new application page
    [Arguments]     ${program_name}

    Wait Until Page Contains Element    xpath=//strong[contains(text(),'${program_name}')]  30
    Wait Until Keyword Succeeds     1min        5secs    Scroll Element Into View   xpath=//strong[contains(text(),'${program_name}')]
    Find And Click Element    xpath=//strong[contains(text(),'${program_name}')]

UserHome: User on Developer Programs
    [Documentation]    Navigates to Developer Program.

    Find And Click Element    ${developer}        validate_elementvisible=${developerpage_header}
    Compare Actual Element text and expected text       ${developerpage_header}         ${exp_developerheader_text}

UserHome: User on Business Programs
    [Documentation]    Navigates to business Program.

    Find And Click Element    ${business}        validate_elementvisible=${businesspage_header}
    Compare Actual Element text and expected text       ${businesspage_header}          ${exp_businessheader_text}

UserHome: User on Applications And Account Tab
    [Documentation]    Navigates to applications and account tab.

    Find And Click Element    ${applications_and_account_option}        validate_elementvisible=${application_history_tab}
    Compare Actual Element text and expected text       ${activetab_checker}          ${exp_app_his_text}

UserHome: User on Businesses Tab
    [Documentation]    Navigates to businesses tab.

    Find And Click Element    ${businesses_option}        validate_elementvisible=${businesses_tab}
    Compare Actual Element text and expected text       ${activetab_checker}          ${exp_bus_text}

UserHome: User on Account And Communication Tab
    [Documentation]    Navigates to businesses tab.

    Find And Click Element    ${settings_option}        validate_elementvisible=${account_and_communication_tab}
    Compare Actual Element text and expected text       ${activetab_checker}          ${exp_comm_text}

UserHome: User on Home Page and validate project presence
    [Documentation]    On Home page
    
    Wait Until Page Contains Element    ${appl_project_name}       30
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_project_name}
    Wait Until Element Is Visible    ${appl_project_name}       30

UserHome: User on Home Page and validate project deletion
    [Documentation]    On Home page
    [Arguments]     ${proj_name}

    Page Should Not Contain    ${proj_name}       30

UserHome: Navigation to Home Page
    [Documentation]    On Home page
    
    Hover Mouse    ${dev_loggedin_profile}
    Find And Click Element    ${dev_loggedin_profile}
    Hover Mouse    ${portal_button}
    Find And Click Element    ${portal_button}
    Wait Until Page Contains Element    ${applications_header}      60


UserHome: Navigate through pages to search for a project
    [Documentation]    Move through pages to search for a project
    [Arguments]     ${proj_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Page Contains Element    ${page_cnt_ele}     30
    Wait Until Element Is Visible    ${page_cnt_ele}        30
    Wait Until Page Contains Element    ${proj_page_cnt}        30
    Wait Until Element Is Visible    ${proj_page_cnt}       30
    ${page_cnt} =   Get Text    ${proj_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//td//b[contains(text(),'${proj_name}')][1]       5
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   xpath=//td//b[contains(text(),'${proj_name}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != True
            Find And Click Element     ${proj_nxt_pg}
            Run Keyword And Ignore Error        Wait Until Page Contains Element    //div[@class='dx-loadpanel-message'][contains(text(),'Loading')]        5
            Run Keyword And Ignore Error        Wait Until Page Does Not Contain Element    //div[@class='dx-loadpanel-message'][contains(text(),'Loading')]        5
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            Run Keyword And Ignore Error    Wait Until Page Contains Element    xpath=//td//b[contains(text(),'${proj_name}')][1]       5
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//td//b[contains(text(),'${proj_name}')][1]
        END


UserHome: Navigate through pages to validate presence of project
    [Documentation]    Move through pages to validate presence of project
    [Arguments]     ${proj_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Page Contains Element    ${page_cnt_ele}     30
    Wait Until Element Is Visible    ${page_cnt_ele}        30
    Wait Until Page Contains Element    ${proj_page_cnt}        30
    Wait Until Element Is Visible    ${proj_page_cnt}       30
    Run Keyword And Ignore Error    Scroll Element Into View    ${applications_header}
    ${page_cnt} =   Get Text    ${proj_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   xpath=//td//b[contains(text(),'${proj_name}')][1]
    WHILE    ${page_cnt} != 1 and ${Result} != 'True'
#      FOR    ${counter}    IN RANGE    1    ${page_cnt}    1
            Find And Click Element     ${proj_nxt_pg}
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            Wait Until Element Is Not Visible       ${loader_icon}      30
            Wait Until Page Contains Element    xpath=//td//b
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//td//b[contains(text(),'${proj_name}')][1]
#      END
    END
    Page Should Contain Element       xpath=//td//b[text()[contains(.,'${proj_name}')]]



UserHome: Navigate through pages to validate deletion of project
    [Documentation]    Move through pages to validate deletion of project
    [Arguments]     ${proj_name}

    Wait Until Element Is Not Visible       ${loader_icon}      60
    Wait Until Page Contains Element    ${page_cnt_ele}     30
    Wait Until Element Is Visible    ${page_cnt_ele}        30
    Wait Until Page Contains Element    ${proj_page_cnt}        30
    Wait Until Element Is Visible    ${proj_page_cnt}       30
    ${page_cnt} =   Get Text    ${proj_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    Page Should Not Contain Element       xpath=//td//b[text()[contains(.,'${proj_name}')]]
    FOR    ${counter}    IN RANGE    1    ${page_cnt}    1
        Find And Click Element     ${proj_nxt_pg}
        Wait Until Element Is Not Visible       ${loader_icon}      40
        Wait Until Page Contains Element    xpath=//td//b
        Page Should Not Contain Element       xpath=//td//b[text()[contains(.,'${proj_name}')]]
    END

UserHome: Navigate to Resume application
    [Documentation]    Move to application page to resume application

    Wait Until Page Contains Element    ${portal_header}      10
    Run Keyword And Ignore Error    Scroll Element Into View    ${portal_header}
    Wait Until Page Contains Element    ${applications_header}      10
    Run Keyword And Ignore Error    Scroll Element Into View    ${applications_header}
    Wait Until Page Contains Element    ${resume_btn}
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View    ${resume_btn}
    Hover Mouse    ${resume_btn}
    Find And Click Element    ${resume_btn}

UserHome: Go to submitted application
    [Documentation]    Go to submitted application

    Wait Until Page Contains Element    ${portal_header}      10
    Run Keyword And Ignore Error    Scroll Element Into View    ${portal_header}
    Wait Until Page Contains Element    ${applications_header}      10
    Run Keyword And Ignore Error    Scroll Element Into View    ${applications_header}
    Wait Until Page Contains Element    ${view_btn}
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View    ${view_btn}
    Hover Mouse    ${view_btn}
    Find And Click Element    ${view_btn}

UserHome: Go to Create a Business
    [Documentation]    admin creates business

    Wait Until Element Is Visible    ${buss_add_btn}      20
    Run Keyword And Ignore Error    Scroll Element Into View    ${buss_list_header}
    Hover Mouse    ${buss_add_btn}
    Find And Click Element    ${buss_add_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     20

UserHome: Navigate through pages to validate presence of business
    [Documentation]    Move through pages to validate presence of business
    [Arguments]     ${tnewbuss_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Page Contains Element    ${buss_page_cnt_ele}     30
    Wait Until Element Is Visible    ${buss_page_cnt_ele}        30
    Wait Until Page Contains Element    ${buss_page_cnt}        30
    Wait Until Element Is Visible    ${buss_page_cnt}       30
    Run Keyword And Ignore Error    Scroll Element Into View    ${buss_list_header}
    ${page_cnt} =   Get Text    ${buss_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   xpath=//td[contains(text(),'${tnewbuss_name}')][1]
    WHILE    ${page_cnt} != 1 and ${Result} != 'True'
#      FOR    ${counter}    IN RANGE    1    ${page_cnt}    1
            Find And Click Element     ${buss_nxt_pg}
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            Wait Until Element Is Not Visible       ${loader_icon}      30
            Wait Until Page Contains Element    xpath=//td
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//td[contains(text(),'${tnewbuss_name}')][1]
#      END
    END
    Page Should Contain Element       xpath=//td[text()[contains(.,'${tnewbuss_name}')]]

UserHome: Navigate through pages to validate deletion of business
    [Documentation]    Move through pages to validate deletion of business
    [Arguments]     ${tnewbuss_name}

    Wait Until Element Is Not Visible       ${loader_icon}      30
    Wait Until Page Contains Element    ${buss_page_cnt_ele}     30
    Wait Until Element Is Visible    ${buss_page_cnt_ele}        30
    Wait Until Page Contains Element    ${buss_page_cnt}        30
    Wait Until Element Is Visible    ${buss_page_cnt}       30
    Run Keyword And Ignore Error    Scroll Element Into View    ${buss_list_header}
    ${page_cnt} =   Get Text    ${buss_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    Page Should Not Contain Element       xpath=//td[text()[contains(.,'${tnewbuss_name}')]]
    FOR    ${counter}    IN RANGE    1    ${page_cnt}    1
        Find And Click Element     ${buss_nxt_pg}
        Wait Until Element Is Not Visible       ${loader_icon}      40
        Wait Until Page Contains Element    xpath=//td
        Page Should Not Contain Element       xpath=//td[text()[contains(.,'${tnewbuss_name}')]]
    END

UserHome: Navigate to businesses pagenumber
    [Documentation]    Navigate to business pagenumber provided as argument
    [Arguments]     ${num}

    Wait Until Page Does Not Contain Element    ${loader_icon}  30
    Clear And Type Into Element    ${buss_pgno_ip}      ${num}
    Wait Until Page Does Not Contain Element    ${loader_icon}  30

UserHome: Search a Project
    [Documentation]    searches a project of a program
    [Arguments]     ${tproj_name}

    Wait Until Page Contains Element    ${search_txtbx}  30
    Clear And Type Into Element    ${search_txtbx}      ${tproj_name}
    Run Keyword And Ignore Error        Wait Until Page Contains Element    //div[@class='dx-loadpanel-message'][contains(text(),'Loading')]        20
    Run Keyword And Ignore Error        Wait Until Page Does Not Contain Element    //div[@class='dx-loadpanel-message'][contains(text(),'Loading')]        20

UserHome: Validate Presence of a Project
    [Documentation]     validates presence of a project of a program
    [Arguments]     ${tproj_name}       ${tincentive_program}

    Wait Until Page Contains Element    xpath=//td//b
    Page Should Contain Element       xpath=//td//b[text()[contains(.,'${tproj_name}')]]//preceding-sibling::small[contains(text(),'${tincentive_program}')]

UserHome: Validate Deletion of a Project
    [Documentation]     validates deletion of a project of a program
    [Arguments]     ${tproj_name}       ${tincentive_program}

    Run Keyword And Ignore Error        Wait Until Page Contains Element    //div[@class='dx-loadpanel-message'][contains(text(),'Loading')]      10
    Run Keyword And Ignore Error        Wait Until Page Does Not Contain Element    //div[@class='dx-loadpanel-message'][contains(text(),'Loading')]      10
    Page Should Not Contain Element       xpath=//td//b[text()[contains(.,'${tproj_name}')]]//preceding-sibling::small[contains(text(),'${tincentive_program}')]