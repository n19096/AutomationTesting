*** Settings ***
Documentation    This file contians page objects for admin home page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot


*** Variables ***

#${logged_in_profile}     xpath=//div[@class='user-name'][contains(text(),'${test_exp_admin_profile_name}')]
${settings_menu}        xpath=//div[contains(text(),'Settings')]
${general_tab}        xpath=//span[contains(text(),'General')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
#Menus
${programs_menu}     xpath=//div[@class='menu-label'][contains(text(),'Programs')]//ancestor::a
${projects_menu}     xpath=//div[@class='menu-label'][contains(text(),'Projects')]//ancestor::a
${contacts_menu}     xpath=//div[@class='menu-label'][contains(text(),'Contacts')]//ancestor::a
${reporting_menu}     xpath=//div[@class='menu-label'][contains(text(),'Reporting')]//ancestor::a
${impacts_menu}     xpath=//div[@class='menu-label'][contains(text(),'Impacts')]//ancestor::a
${incentive_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Incentive')][not(contains(text(),'Non'))]//ancestor::a
${non_incentive_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Non-Incentive')]//ancestor::a
#Program Submenus
${tif_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'TIF')]//parent::a
${grant_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Grant')]//parent::a
${bdd_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Business Development District')]//parent::a
${loan_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Loan')]//parent::a
${ez_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Enterprise Zone')]//parent::a
${fm_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Farmer's Market')]//parent::a
${mss_program_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Main Street Sign Up')]//parent::a
${vacancyrates_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Vacancy Rates')]//parent::a
${programmanagement_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Program Management')]//parent::a

#Project Submenus
${all_projects_submenu}     xpath=//div[@class='menu-label'][contains(text(),'All')]//parent::a
${active_projects_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Active')]//parent::a
${denied_projects_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Denied')]//parent::a
${pendingapproval_projects_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Pending Approval')]//parent::a
${closed_projects_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Closed')]//parent::a

${project_commision_status}     xpath=//div[contains(text(),'Project Commission Status')]//following-sibling::div//div[@class='dx-tag-content']//span

#Contacts Submenus
${people_submenu}     xpath=//div[@class='menu-label'][contains(text(),'People')]//parent::a
${businesses_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Businesses')]//parent::a
${communications_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Email History')]//parent::a
${templates_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Templates')]//parent::a

#Reporting Submenus
${compliance_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Compliance')]//parent::a
${intelligence_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Intelligence')]//parent::a

#Impacts Submenus
${forecasting_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Forecasting')]//parent::a
${scoring_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Scoring')]//parent::a
${key_performance_indicators_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Key Performance Indicators')]//parent::a
${parcels_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Parcels')]//parent::a
${agreement_compliances_submenu}     xpath=//div[@class='menu-label'][contains(text(),'Compliance')]//parent::a

#Program Page Headers
${tif_program_header}     xpath=//h3[contains(text(),'TIF Dashboard')]
${grant_program_header}     xpath=//h3[contains(text(),'Grant Dashboard')]
${loan_program_header}     xpath=//h3[contains(text(),'Loan Dashboard')]
${ez_program_header}     xpath=//h3[contains(text(),'Enterprise Zone Dashboard')]
${bdd_program_header}     xpath=//h3[contains(text(),'Business Development District Dashboard')]
${fm_program_header}     xpath=//h1[contains(text(),'Farmer')]
${mss_program_header}     xpath=//h1[contains(text(),'Main Street')]
${vacancy_rates_header}     xpath=//h1[contains(text(),'Vacancy Rates')]
${programmanagement_header}     xpath=//h3[contains(text(),'Programs')]

#Project Page Headers

${all_projects_header}     xpath=//h3[contains(text(),'All projects')]
${active_projects_header}     xpath=//h3[contains(text(),'Active projects')]
${closed_projects_header}     xpath=//h3[contains(text(),'Closed projects')]
${pendingapproval_projects_header}     xpath=//h3[contains(text(),'Pending projects')]
${denied_projects_header}     xpath=//h3[contains(text(),'Denied projects')]

#Project Page Headers
${people_header}     xpath=//h3[contains(text(),'Contacts')]
${businesses_header}     xpath=//h3[contains(text(),'Businesses')]
${email_hist_header}     xpath=//h3[contains(text(),'Email History')]
${templates_header}     xpath=//h3[contains(text(),'Email Templates')]

#Reporting Headers
${compliance_report_header}     xpath=//h3[contains(text(),'Compliance Reports')]
${intelligence_report_header}     xpath=//h3[contains(text(),'Intelligence Reports')]


#Impacts Headers
${agreement_compliances_header}     xpath=//h3[contains(text(),'Agreement Compliance Dashboard')]
${key_performance_indicators_header}     xpath=//h3[contains(text(),'Key Performance Indicator Dashboard')]
${forecasting_report_header}     xpath=//h3[contains(text(),'Economic Impact Forecasting Tool')]
${scoring_header}     xpath=//h3[contains(text(),'Scoring Dashboard')]


*** Keywords ***

AdminHome: Admin on Incentive TIF Program
    [Documentation]    Navigates to TIF Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${incentive_program_submenu}
    Find And Click Element    ${tif_program_submenu}        validate_elementvisible=${tif_program_header}

AdminHome: Admin on Incentive Grant Program
    [Documentation]    Navigates to Grant Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${grant_program_submenu}        validate_elementvisible=${grant_program_header}

AdminHome: Admin on Incentive BDD Program
    [Documentation]    Navigates to Business Development District Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${bdd_program_submenu}        validate_elementvisible=${bdd_program_header}

AdminHome: Admin on Incentive Loan Program
    [Documentation]    Navigates to Loan Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${loan_program_submenu}        validate_elementvisible=${loan_program_header}

AdminHome: Admin on Incentive EZ Program
    [Documentation]    Navigates to EZ Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${ez_program_submenu}        validate_elementvisible=${ez_program_header}

AdminHome: Admin on Non Incentive Farmers Market Program
    [Documentation]    Navigates to Farmer's Market Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${fm_program_submenu}        validate_elementvisible=${fm_program_header}

AdminHome: Admin on Non Incentive Main Street Sign Up Program
    [Documentation]    Navigates to Main Street SignUp Program.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${mss_program_submenu}        validate_elementvisible=${mss_program_header}

AdminHome: Admin on Internal Vacancy Rates
    [Documentation]    Navigates to Vacancy rates.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${vacancyrates_submenu}        validate_elementvisible=${vacancy_rates_header}

AdminHome: Admin on Program Management
    [Documentation]    Navigates to Program Management.
    Hover Mouse    ${programs_menu}
    Find And Click Element    ${programs_menu}
    Find And Click Element    ${programmanagement_submenu}      validate_elementvisible=${programmanagement_header}

AdminHome: Admin on All Projects
    [Documentation]    Navigates to all projects.


    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element    xpath=//h3[contains(text(),'Dashboard')]     30
    Wait Until Page Contains Element    ${projects_menu}        30
    Hover Mouse     ${projects_menu}
    Find And Click Element    ${projects_menu}
    Wait Until Page Contains Element    ${all_projects_submenu}     30
    Hover Mouse     ${all_projects_submenu}
    Find And Click Element    ${all_projects_submenu}
#    validate_elementvisible=${all_projects_header}
    Wait Until Element Is Visible    ${all_projects_header}     60

AdminHome: Admin on Active Projects
    [Documentation]    Navigates to active projects.

    Hover Mouse    ${projects_menu}
    Find And Click Element    ${projects_menu}
    Find And Click Element    ${active_projects_submenu}        validate_elementvisible=${active_projects_header}
    #Compare Actual Element text and expected text       ${project_commision_status}           ${exp_active_text}

AdminHome: Admin on Closed Projects
    [Documentation]    Navigates to closed projects.

    Hover Mouse    ${projects_menu}
    Find And Click Element    ${projects_menu}
    Find And Click Element    ${closed_projects_submenu}        validate_elementvisible=${closed_projects_header}

AdminHome: Admin on Pending Approval Projects
    [Documentation]    Navigates to pending approval projects.

    Hover Mouse    ${projects_menu}
    Find And Click Element    ${projects_menu}
    Find And Click Element    ${pendingapproval_projects_submenu}        validate_elementvisible=${pendingapproval_projects_header}

AdminHome: Admin on Denied Projects
    [Documentation]    Navigates to denied projects.

    Hover Mouse    ${projects_menu}
    Find And Click Element    ${projects_menu}
    Find And Click Element    ${denied_projects_submenu}        validate_elementvisible=${denied_projects_header}

 AdminHome: Admin on People contacts
    [Documentation]    Navigates to people contacts.

    Wait Until Page Contains Element    ${contacts_menu}        30
    Hover Mouse    ${contacts_menu}
    Find And Click Element    ${contacts_menu}
    Find And Click Element    ${people_submenu}        validate_elementvisible=${people_header}

AdminHome: Admin on Businesses
    [Documentation]    Navigates to businesses details.

    Wait Until Page Contains Element    ${contacts_menu}        30
    Hover Mouse    ${contacts_menu}
    Find And Click Element    ${contacts_menu}
    Find And Click Element    ${businesses_submenu}
#    validate_elementvisible=${businesses_header}

AdminHome: Admin on Email History
    [Documentation]    Navigates to email history.

    Hover Mouse    ${contacts_menu}
    Find And Click Element    ${contacts_menu}
    Find And Click Element    ${communications_submenu}        validate_elementvisible=${email_hist_header}

AdminHome: Admin on Templates
    [Documentation]    Navigates to templates.

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Hover Mouse    ${contacts_menu}
    Find And Click Element    ${contacts_menu}
    Find And Click Element    ${templates_submenu}        validate_elementvisible=${templates_header}

 AdminHome: Admin on Compliance Reports
    [Documentation]    Navigates to compliance reports.

    Hover Mouse    ${reporting_menu}
    Find And Click Element    ${reporting_menu}
    Find And Click Element    ${compliance_submenu}        validate_elementvisible=${compliance_report_header}

AdminHome: Admin on Intelligence Reports
    [Documentation]    Navigates to intelligence reports.
    Hover Mouse    ${reporting_menu}
    Find And Click Element    ${reporting_menu}
    Find And Click Element    ${intelligence_submenu}        validate_elementvisible=${intelligence_report_header}

 AdminHome: Admin on Forecasting
    [Documentation]    Navigates to forecasting.
    Hover Mouse    ${impacts_menu}
    Find And Click Element    ${impacts_menu}
    Find And Click Element    ${forecasting_submenu}        validate_elementvisible=${forecasting_report_header}

AdminHome: Admin on Scoring
    [Documentation]    Navigates to scoring.
    Hover Mouse    ${impacts_menu}
    Find And Click Element    ${impacts_menu}
    Find And Click Element    ${scoring_submenu}        validate_elementvisible=${scoring_header}

AdminHome: Admin on KeyPerformanceIndicators
    [Documentation]    Navigates to keyperformanceindicators.

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${impacts_menu}
    Find And Click Element    ${impacts_menu}
    Hover Mouse    ${key_performance_indicators_submenu}
    Find And Click Element    ${key_performance_indicators_submenu}        validate_elementvisible=${key_performance_indicators_header}


AdminHome: Navigate to Settings Page
    [Documentation]     Navigates to settings page
    [Arguments]     ${test_exp_admin_profile_name}
    
    Find And Click Element    xpath=//div[@class='user-name'][contains(text(),'${test_exp_admin_profile_name}')]
    Wait Until Page Contains Element    ${settings_menu}        20
    Find And Click Element    ${settings_menu}
    Wait Until Page Contains Element    ${general_tab}      20

AdminHome: Admin On Compliances Dashboard Page
    [Documentation]     Navigates to compliances dashboard page

    Hover Mouse    ${impacts_menu}
    Find And Click Element    ${impacts_menu}
    Hover Mouse    ${agreement_compliances_submenu}
    Find And Click Element    ${agreement_compliances_submenu}        validate_elementvisible=${agreement_compliances_header}





    


