*** Settings ***
Documentation    This file contians page objects for notification settings page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot

Library    SeleniumLibrary

*** Variables ***

${project_submitted_edit}
${users_to_notify}
${civicserve_dep}
${econdev_dep}
${test_dep}
${email_temp}
${email_temp_opt}
${sub}
${heading}
${body}
${not_popup_cancel_btn}
${not_popup_update_btn}

*** Keywords ***

NotificationSettings: Admin edits notification settings of Program
    [Documentation]    Edits notification settings of a Program.

    Find And Click Element    ${project_submitted_edit}
    Clear And Type Into Element    ${users_to_notify}    ${tusers_to_notify}
    Find And Click Element    ${civicserve_dep}
    #Emailtemplate
    Find And Click Element    ${email_temp}
    Find And Click Element    ${email_temp_opt}
    #Custom template
    #Clear And Type Into Element    ${sub}     ${tsub}
    #Clear And Type Into Element    ${heading}     ${theading}
    #Clear And Type Into Element    ${body}     ${tbody}
    Find And Click Element    ${not_popup_update_btn}