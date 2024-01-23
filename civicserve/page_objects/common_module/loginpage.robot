*** Settings ***
Documentation    This file contians page objects for login page.

Resource         ../../test_data/testdata.robot
Library    ExcelUtil
Library    SeleniumLibrary

*** Variables ***
${login_link}     xpath=//span[contains(text(),'Log in')]
#css=a[href='/Account/Login']
${username}        xpath=//input[@name='email']
${password}         xpath=//input[@name='password']
${login_btn}     xpath=//span[@class='dx-button-text'][contains(text(),'Log In')]
${admin_loggedin_profile}       xpath=//div[@class='user-name']
#[contains(text(),'${test_exp_admin_profile_name}')]
${dev_loggedin_profile}         xpath=//button[@id='login-btn']//span
#[contains(text(),'${test_exp_profile_name}')]
${invalidattempt_message}         xpath=//div[@role='alert'][contains(text(),'Invalid user name or password')]
${acctlocked_message}         xpath=//div[@role='alert'][contains(text(),'Your account has been locked due to multiple unsuccessful login attempts')]
#//li[contains(text(),'Invalid login attempt.')]
${ActProfileName}
${reset_pswd}        xpath=//input[@name='newPassword']
${reset_cnfrmpswd}         xpath=//input[@name='confirmNewPassword']
${reset_pswdbtn}         xpath=//span[contains(text(),'Reset Password')]
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]

*** Keywords ***


Read Test Data from Excel
    [Arguments]     ${test_type}    ${esheet}

    ${document}=    Open Excel      TestData/Book2.xlsx
    &{dict} =    Create Dictionary
    ${coumn_count}=     Get Column count    ${esheet}
    ${row_count}=   Get Row count   ${esheet}
    FOR    ${i}     IN RANGE    1   ${row_count}
        ${rowname}=     Read Cell Data By Coordinates       ${esheet}    ${i}     1
        IF    '${rowname}'=='${test_type}'
            FOR    ${k}     IN RANGE  1     25
                Read Cell Data By Coordinates       ${esheet}      ${i}     ${k}
                ${column2}=     Read Cell Data By Coordinates       ${esheet}    ${i}     ${k}
                ${column}=     Read Cell Data By Coordinates       ${esheet}    1     ${k}
                Set To Dictionary    ${dict}    ${column}   ${column2}
            END
        END
    END
    Set Test Variable     ${dict}    &{dict}

Admin: User on CivicServe Admin Site
    [Documentation]    Logs into admin site.
    [Arguments]     ${test_type}    ${sheet}

    Read Test Data From Excel   ${test_type}    ${sheet}
    Wait Until Element Is Visible    ${login_link}      60
    Find And Click Element    ${login_link}
    Clear And Type Into Element    ${username}    ${dict}[Username_ID]
    Clear And Type Into Element - Secure    ${password}    ${dict}[password]
    Find And Click Element    ${login_btn}
        #validate_elementvisible=${admin_loggedin_profile}
    Wait Until Page Contains Element        ${admin_loggedin_profile}     60
    Element Should Contain    ${admin_loggedin_profile}            ${dict}[profile_name]
#    Compare Actual Element text and expected text    ${admin_loggedin_profile}            ${test_exp_admin_profile_name}

User: Public User on CivicServe Site
    [Documentation]    Logs into site as public user
    [Arguments]     ${test_type}    ${sheet}

    Read Test Data From Excel   ${test_type}    ${sheet}
    Find And Click Element    ${login_link}
    Clear And Type Into Element    ${username}    ${dict}[Username_ID]
    Clear And Type Into Element - Secure    ${password}    ${dict}[password]
    Find And Click Element    ${login_btn}
    Wait Until Page Contains Element        ${dev_loggedin_profile}     120
    Element Should Contain    ${dev_loggedin_profile}            ${dict}[profile_name]
#    Compare Actual Element text and expected text    ${dev_loggedin_profile}            ${test_exp_profile_name}

User: User on Invalid Credentials Message Page
    [Documentation]    Logs into site with invalid credentials
    [Arguments]     ${test_type}    ${sheet}

    Read Test Data From Excel   ${test_type}    ${sheet}
    Find And Click Element    ${login_link}
    Clear And Type Into Element    ${username}      ${dict}[Username_ID]
    Clear And Type Into Element - Secure    ${password}     ${dict}[password]
    Find And Click Element    ${login_btn}    validate_elementvisible=${invalidattempt_message}

User: User on Account Locked Message Page
    [Documentation]    Logs into site with invalid credentials
    [Arguments]     ${dev_invalidusername}        ${dev_invalidpassword}

    Find And Click Element    ${login_link}
    Clear And Type Into Element    ${username}    ${dev_invalidusername}
    Clear And Type Into Element - Secure    ${password}    ${dev_invalidpassword}
    Find And Click Element    ${login_btn}    validate_elementvisible=${acctlocked_message}

User: User On Reset Password Page
    [Documentation]    resets password
    [Arguments]     ${dev_password}

    Wait Until Page Contains Element    ${reset_pswd}       20
    Clear And Type Into Element - Secure    ${reset_pswd}    ${dev_password}
    Clear And Type Into Element - Secure    ${reset_cnfrmpswd}    ${dev_password}
    Find And Click Element    ${reset_pswdbtn}
    Wait Until Page Does Not Contain Element    ${reset_pswd_btn}   20
    Wait Until Page Contains Element    ${added_success_msg}     30


