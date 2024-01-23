*** Settings ***
Documentation     This resource file contains objects to setup test.

Resource          ../../global_shared_resources/test_setup/library_setup.robot

#==============================================================================
#   App Library Imports
#==============================================================================

Resource          common_functions.robot
Resource            common_module/loginpage.robot
Resource            admin_module/admin_homepage.robot
Resource            admin_module/program_management_page.robot
Resource            admin_module/contacts_page.robot
Resource            admin_module/projects_page.robot
Resource            admin_module/templates_page.robot
Resource            ../test_data/testdata.robot
Resource            admin_module/emailpage.robot
Resource            admin_module/connect_to_db.robot
Resource            publicuser_module/publicuser_homepage.robot
Resource            publicuser_module/application_page.robot
Resource            admin_module/tif_dashboard_page.robot
Resource            admin_module/email_his_page.robot
Resource            publicuser_module/submitted_application_page.robot
Resource            admin_module/settings_page.robot
Resource            publicuser_module/publicuser_businesses_page.robot
Resource            admin_module/compliances_page.robot
Resource            admin_module/compliances_dashboard_page.robot
Resource            admin_module/kpis_page.robot
Resource            admin_module/kpi_dashboard_page.robot
*** Variables ***
#############
# Test URL #
#############
#${TEST_URL}             https://dev.civicserve.com
${TEST_URL}             https://test.civicserve.com
#https://gmail.com
#http://localhost:3000/
#https://dev.civicserve.com


#############
# Test Data #
#############

*** Keywords ***
Open Browser Window
    [Documentation]    Sets desktop variable and launches the browser with test url.
    
    Desktop Test
    Custom Open Browser And Setup
    User Loads Desktop Resolution
    
Open New Empty Browser Window
    [Documentation]    Sets desktop variable and launches browser with out URL.
    
    Desktop Test
    Custom Open Browser And Setup    load_url=about:blank
    User Loads Desktop Resolution

Open New Empty Browser Window For Fake Media Stream
    [Documentation]    Sets desktop variable, sets fake media capabilities and launches browser with out URL.
    
    Set Suite Variable    ${fake_media_stream}    True
    Desktop Test
    Custom Open Browser And Setup    load_url=about:blank
    User Loads Desktop Resolution