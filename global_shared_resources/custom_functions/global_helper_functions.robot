*** Settings ***
Documentation    This resource file contains global helper keywords.
Library    SeleniumLibrary
#Library    ExcelLibrary
Resource    ../../civicserve/page_objects/admin_module/admin_homepage.robot

*** Variables ***
${randomizer}    0
${certificate_verification_not_required_text}    CERT_NONE
${certificate_verification_required_text}        CERT_REQUIRED

${timezone_pacific_format}                       US/Pacific
${timezone_eastern_format}                       US/Eastern

# Below is a javascript function that will load a jQuery library onto a web page,
# if needed. Most pages we test have jQuery already on it, but in cases where it is not, this
# is passed to a keyword to execute asynchronous javascript and load a jQuery library.
${jquery_load_script}    (function(jqueryUrl, callback) {
    ...    if (typeof jqueryUrl != 'string') {
    ...    jqueryUrl = 'https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js';}
    ...    if (typeof jQuery == 'undefined') {
    ...    var script = document.createElement('script');
    ...    var head = document.getElementsByTagName('head')[0];
    ...    var done = false;
    ...    script.onload = script.onreadystatechange = (function() {
    ...    if (!done && (!this.readyState || this.readyState == 'loaded' || this.readyState == 'complete')) {
    ...            done = true; script.onload = script.onreadystatechange = null;
    ...            head.removeChild(script); callback();}});
    ...    script.src = jqueryUrl; head.appendChild(script);}
    ...    else {callback();}})(arguments[0], arguments[arguments.length - 1]);

*** Keywords ***
# BELOW KEYWORD BUNDLES FAILURE DETAILS AND WILL FAIL THE TEST. 
# CUSTOM_FAIL_MSG ALLOWS A CUSTOM MESSAGE TO BE PROVIDED DEPENDING 
# ON THE TEST CIRCUMSTANCES.
Fail With Failure Details 
    [Documentation]    Logs title, location, captures screenshot and Fails with custom message.
    [Arguments]    ${custom_fail_msg}=Test has failed with failure details
    
    Log Title
    Log Location
    Capture Page Screenshot
    Fail    ${custom_fail_msg}

Fail With Location Detail    
    [Documentation]    Logs location and Fails with custom message.
    [Arguments]    ${custom_fail_msg}=Test has failed with failure details
    
    Log Location
    Fail    ${custom_fail_msg}
    
Delete Cookies And Pass Execution    
    [Documentation]    Delates cookies and stops the test case execution, marking it as pass.
    [Arguments]    ${custom_msg}=Pass Execution keyword has been run and ended the test.
    
    Repeat Keyword    2 times    Delete All Cookies
    Pass Execution    ${custom_msg}
## ==============================================
## ==============================================
Print To Log And Console    
    [Documentation]    Prints custom message to log and console.
    [Arguments]    ${custom_msg}=.
    
    Log    ${custom_msg}    console=True
    
Add Warning To Log And Pass Execution
    [Arguments]    ${message_to_be_logged}
    
    [Documentation]    Adds warning message at top of the log file and passes execution for known application issues 
    
    Log    ${message_to_be_logged}    level=warn
    Pass Execution    ${message_to_be_logged}
    
Check Location Against Regex
    [Documentation]    Compares the current url against regular expression.
    [Arguments]    ${expected_regex_link}
    
    ${current_url}    Log Location
    Log    ${expected_regex_link}
    Should Match Regexp    ${current_url}    ${expected_regex_link}

Global Page Has Loaded
    Wait Until Keyword Succeeds     2x       2s
    ...    Wait For Condition    return document.readyState == 'complete'

Global Wait For Page To Load
    [Documentation]    Keyword waits for page to load. Sometimes observed blank screen is getting displayed during transition of pages. This may work, if not will remove.
    
    Wait For Condition    return window.jQuery != undefined && jQuery.active == 0
    Wait Until Page Contains Element    //body

Verify Title Of The Page  
    [Documentation]    Verifies title contains expected page title and does not contain words like 404 or Error
    [Arguments]  ${Expected page title}
    
    ${Actual page title}    Get Title 
    Should Contain  ${Actual page title}  ${Expected page title}
    Should Not Contain  ${Actual page title}  404
    Should Not Contain  ${Actual page title}  Error

Verify URL Of The Page  
    [Documentation]    Verifies current URL contains ${Expected page url}. For Firefox browse, modifies expected URL as per FF compatablity and compares.  
    [Arguments]    ${Expected page url}
    
    ${Actual page url}    Get Location
    Log    ${Actual page url}
    Log    ${Expected page url}
    Should Contain
    ...    ${Actual page url}    ${Expected page url}
    
Clear And Type Into Element
    [Arguments]
    ...    ${field_location}
    ...    ${text_entry}
    ...    ${timeout}=${wait_time}
    ...    ${fast_type_mode}=True
    ...    ${slow_mode_delay}=0.1
    ...    ${click_element}=False
    [Documentation]    This keyword will wait until the field_location is visible, clear any text 
    ...                in the field_location, then will enter the text_entry into it. 
    ...                Added option to type into a field_location in "slow mode", as there are 
    ...                some cases where the keyword "Input Text" enters text too quickly for 
    ...                certain fields and causes failures. setting fast_type_mode to False will
    ...                use the slow mode method. You can also control the speed of the typing in
    ...                slow mode by setting slow_mode_delay to a numerical setting in 
    ...                seconds/milliseconds.
    Wait Until Element Is Visible         ${field_location}    ${timeout}
    Run Keyword If    ${click_element}
    ...    Find And Click Element    ${field_location}
    Wait Until Element Is Visible         ${field_location}    120
    Wait Until Keyword Succeeds    1min        5sec
           ...    Clear Element Text    ${field_location}
    Wait Until Element Is Visible         ${field_location}    120
    Run Keyword If    ${fast_type_mode}
    ...    Wait Until Keyword Succeeds    1min        5sec
           ...    Input Text                     ${field_location}    ${text_entry}
    ...    ELSE    Input Text - slow mode    ${field_location}    ${text_entry}    ${slow_mode_delay}

Input Text for New Fields
    [Arguments]
    ...    ${field_location}
    ...    ${text_entry}
    ...    ${timeout}=${wait_time}
    ...    ${fast_type_mode}=True
    ...    ${slow_mode_delay}=0.1
    ...    ${click_element}=False
    [Documentation]    This keyword will wait until the field_location is visible, then will enter the text_entry into it.
    ...                Added option to type into a field_location in "slow mode", as there are
    ...                some cases where the keyword "Input Text" enters text too quickly for
    ...                certain fields and causes failures. setting fast_type_mode to False will
    ...                use the slow mode method. You can also control the speed of the typing in
    ...                slow mode by setting slow_mode_delay to a numerical setting in
    ...                seconds/milliseconds.
    Wait Until Element Is Visible         ${field_location}    ${timeout}
    Run Keyword If    ${click_element}
    ...    Find And Click Element    ${field_location}
    Wait Until Element Is Visible         ${field_location}    120
    Run Keyword If    ${fast_type_mode}
    ...    Wait Until Keyword Succeeds    1min        5sec
           ...    Input Text                     ${field_location}    ${text_entry}
    ...    ELSE    Input Text - slow mode    ${field_location}    ${text_entry}    ${slow_mode_delay}

Clear Text Characters
    [Arguments]    ${field}
    [Documentation]    Keyword removes the content of an input field using keyboard keys
    
    Press Keys    ${field}    HOME
    ${text}    Get Value    ${field}
    ${char_count}    Get Length    ${text}
    FOR    ${loop_var}    IN RANGE    0    ${char_count}
        Press Keys    ${field}    BACKSPACE
        ${temp_text}    Get Value    ${field}
        ${temp_char_count}    Get Length    ${temp_text}
        Run Keyword If    ${temp_char_count}>=${char_count}
        ...    Press Keys    ${field}    DEL
        Exit For Loop If    '''${temp_text}''' == '''${EMPTY}'''
    END    

Input Text - Slow Mode
    [Arguments]
    ...    ${field location}
    ...    ${text entry}
    ...    ${slow_mode_delay}=0.1
    [Documentation]    This function is used with "Clear And Type Into Element" function. It can be
    ...                triggered from that function by passing the optional argument 
    ...                "fast_type_mode=False" along with the field location and text entry
    ...                arguments.
    ...                Keyword breaks text_entry string into characters, then loops through them, 
    ...                simulating a press key for each character. To control the speed of the 
    ...                input, slow_mode_delay can be set to whatever number is needed. Defaults to 
    ...                1/10 of a second (0.1).
    ${text_characters}    Split String To Characters    ${text entry}
    FOR    ${char}    IN    @{text_characters}
        Press Keys    ${field location}    ${char}
        Sleep    ${slow_mode_delay}
    END
    Log    Entered text '${text entry}' into field ${field location}
    
Clear And Type Into Element - Secure
    [Arguments]
    ...    ${field location}
    ...    ${text entry}
    ...    ${timeout}=${wait_time}
    [Documentation]    This keyword will wait until the field_location is visible, clear any text 
    ...                in the field_location, then will enter the text_entry into it. The 
    ...                difference between this keyword and the non-secure one is this one does
    ...                not store entered text in the log or xml Robot Framework files, making it
    ...                the preferred method to keep passwords used in the testing secure.
    
    Wait Until Element Is Visible    ${field location}    ${timeout}
    Clear Element Text    ${field location}
    Input Password    ${field location}    ${text entry}

Switch Window, Verify Element, Switch Back to Main Window
    [Documentation]    Selects second window, verifies ${element}, closes it and switch back to main window.
    [Arguments]
    ...    ${page title}
    ...    ${element}
    ...    ${sleep_time}=5

    Select Window    ${page title}
    Verify Element On Page    ${element}
    Close Second Window, Switch Back to Main Window

Close Second Window, Switch Back to Main Window
    [Documentation]    Closes the current window and switch to Main window.

    Close Window
    Switch Window

Create List To Generate Random Variable    [Arguments]    ${number_of_elements_on_page}    ${range_start}=0
    [Documentation]    Creates and returns a list containing numbers from 0 to ${number_of_elements_on_page}.   
    
    # ====================
    ${num_list}    Create List
    FOR    ${num}    IN RANGE    ${range_start}    ${number_of_elements_on_page}
        Append To List    ${num_list}    ${num}
    END    
    # ===================
    Set Global Variable    ${num_list}    ${num_list}
    [Return]    ${num_list}

Javascript Scroll To Bottom of Page
    [Documentation]    Gets the window size of the browser page and then scrolls
    ...                to the entered size. Note this may not scroll all the way 
    ...                to the bottom of a page if the page has a lazy load; it 
    ...                will only scroll to whatever the browser page is during the
    ...                the get window size keyword size capture.
    ${height}    ${width}    Get Window Size
    Execute Javascript    return window.scrollTo(${width},${height})

Javascript Scroll Down Half The Page
    [Documentation]    Scrolls down to half of the page.
    
    ${height}    ${width}    Get Window Size
    #Log To Console    ${height}
    ${half height}    Evaluate    ${height} / 2
    #Log To Console    Half size of windows: ${half height}
    Execute Javascript    return window.scrollTo(${width},${half height})

Javascript Scroll To Top Of Page    [Arguments]    ${page}=window
    [Documentation]    Scrolls to top of the page.
    
    Run Keyword If    '${page}' == 'window'
    ...    Execute Javascript    return ${page}.scrollTo(0,0)
    ...    ELSE    Execute Javascript    return ${page}.scrollTop(0,0)
    Sleep    0.2

Javascript Scroll To Top Of The Page    
    [Documentation]    Scrolls to top of the page.
    
    Execute Javascript    window.scrollTo(0,0)
    Sleep    0.5

Javascript Scroll Item Into View    [Arguments]    ${element}    ${scrollBool}=false
    [Documentation]    Scrolls item into view using jQuery. ${scrollBool} used for jQuery command;
    ...                must be a lowercase false or lowercase true. using false will display item
    ...                towards bottom of page, while true will display item at top of page.
    ${element_ready}    Remove Element Variable Tag    ${element}
    
    Run Keyword If    '''"''' in '''${element_ready}'''
    ...    Execute Javascript    document.querySelector('${element_ready}').scrollIntoView(${scrollBool})
    ...    ELSE    Execute Javascript    document.querySelector("${element_ready}").scrollIntoView(${scrollBool})

Javascript Scroll Item to Element    [Arguments]    ${element}      ${top_element}
    [Documentation]    Scrolls item to element using jQuery.
    ${element_ready}    Remove Element Variable Tag    ${element}
    #${top_element_ready}    Remove Element Variable Tag    ${top_element}
    #${navbar}      Execute Javascript    document.evaluate(${top_element_xpath}, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    Run Keyword If    '''"''' in '''${element_ready}'''
    #var scrollDiv = document.getElementByXpath("${xpath}").offsetTop
    #window.scrollTo({ top: document.getElementByXpath("${xpath}").offsetTop, behavior: 'smooth'})
    ...    Execute Javascript    document.querySelector('${element_ready}').scrollElementIntoView(${top_element})
    ...    ELSE    Execute Javascript    document.querySelector('${element_ready}').scrollElementIntoView(${top_element})
    
Javascript Stop Page Load
    [Documentation]    Stops the page loading using javascript.
    
    Execute Javascript    return window.stop();

Get Vertical Position Using JS
    [Documentation]    Gets vertical position of an element by executing Javascript.
    [Arguments]    ${element}
    
    ${element_ready}    Remove Element Variable Tag    ${element}
    
    ${get_positions}    Run Keyword If    '''"''' in '''${element_ready}'''
    ...    Execute Javascript    return $('${element_ready}').position()
    ...    ELSE    Execute Javascript    return $("${element_ready}").position()

    ${get_vertical_pos}=    Get From Dictionary    ${get_positions}    top
    [Return]    ${get_vertical_pos}

Load jQuery On Page
    [Documentation]    On pages where jQuery may not be loaded onto a page by default, running 
    ...                this keyword will execute a javascript function that will load a jQuery
    ...                library, which the tests can then use to run custom jQuery commands, if 
    ...                needed.
    
    ${checkfor_jquery}    Execute Javascript    window.jQuery
    
    Run Keyword If    ${checkfor_jquery} == None
    ...    Execute Async Javascript    ${jquery_load_script}

Get Variable Count    [Arguments]    ${element}    ${tag_to_use}=jquery
    [Documentation]    This keyword uses jQuery to count number of elements matching the input
    ...                locator. It can take jQuery or CSS element argument only.
    ...                
    ...                tag_to_use argument is how you want to search for the element in the for 
    ...                loop. This is helpful for checking bundled locators after they have been
    ...                broken up to be checked separately. Defaults to jquery, however some pages
    ...                do not have jquery on them, so you can switch this to css for it to work.
    ...                
    ...                In below example, the element locator jquery=.hello is entered, and 3
    ...                elements are found on the page matching that locator:
    ...
    ...                >>>Get variable count    jquery=.hello
    ...                >>>3
    ...                Additionally, the function can take bundled element locators, like so:
    ...                >>>Get variable count    jquery=.hello, .world, #all
    ...                >>>5
    ...                The function will separate each bundled locator separated by a comma and
    ...                count them individually, returning a full count of all matching locators.
    # ====================
    ${element_to_count}
    ...    Remove Element Variable Tag    ${element}
    # ====================
    ${new_element_list}    Create List
    ${new_element_list}    Split String Using Regex    ${element_to_count}
    ${total_count}   Set Variable    0
    # ====================
    Register Keyword To Run On Failure    Nothing
    # ====================
    FOR    ${locator}    IN    @{new_element_list}
        ${check_element}    Run Keyword And Return Status
        ...    Page Should Contain Element    ${tag_to_use}=${locator}    loglevel=NONE
        ${count}    Run Keyword If    ${check_element}
        ...    Execute Javascript    return ($("${locator}").length);
        ...    ELSE    Set Variable    0
        ${total_count}    Evaluate    ${total_count} + ${count}
    END    
    Set Fail Message Details
    Set Test Variable    ${var_count}    ${total_count}
    
    [Return]    ${total_count}
    
Remove Element Variable Tag
    [Arguments]    ${element}    ${tag_to_remove}=(jquery|css)=
    ${removeVarTag}=
    ...    Remove chars using regex
    ...    ${element}    chars_to_remove=${tag_to_remove}
    [Return]    ${removeVarTag}

Remove Chars Using Regex
    [Arguments]    ${element}    ${chars_to_remove}=(jquery|css)=    ${num_to_remove}=-1
    ${removeChars}
    ...    Replace String Using Regexp
    ...    ${element}    (?i)${chars_to_remove}    ${EMPTY}    count=${num_to_remove}
    [Return]    ${removeChars}

Randomizer    [Arguments]    ${set_randomize_num}=2    ${set_test_var}=False    ${range_start}=0
    [Documentation]    Defaults to selecting 0 or 1 to make random 50/50 decision. Optional argument can be given by providing a different number; if 3 is entered, random decision of 0-2 will be given, etc.
    ${randomizer}    Evaluate    random.randint(${range_start},${set_randomize_num}-1)    modules=random
    Run Keyword If    ${set_test_var} == True
    ...    Set Test Variable    ${randomizer}    ${randomizer}
    [Return]    ${randomizer}

## ============================================
## ============================================
Get Last Date Of A Month
    [Documentation]    Keyword returns the last day of current month    
    
    ${datetime}    Get Current Date    result_format=datetime
    ${month}    Convert To Integer    ${datetime.month}
    ${year}     Convert To Integer     ${datetime.year}
    ${today}    Convert To Integer    ${datetime.day}
    
    ${next_month}    Set Variable If    ${month}== 12      1       ${month+1}   
    ${next_month_year}    Set Variable If    ${month}== 12     ${year+1}      ${year}
    ${first_of_next_month}    Convert Date   ${next_month}/01/${next_month_year}      result_format=%m/%d/%Y         date_format=%m/%d/%Y
    ${current_month_last_day}    Subtract Time From Date     ${first_of_next_month}     1 days      result_format=%d   date_format=%m/%d/%Y
    [Return]    ${current_month_last_day}

Global Switch Window If Link Opens In New Window
    [Documentation]    This checks to see if the window opens, and will switch to 
    ...                it if open.
    [Arguments]    ${elementToClick}
    @{windowsBefClick}     Get Window Identifiers
    ${countOfWinBef}    Get Length    ${windowsBefClick}
    Find, Scroll To And Click Element    ${elementToClick}    
    Sleep    2s
    @{windowsAftClick}     Get Window Identifiers
    ${countOfWinAft}    Get Length    ${windowsAftClick}
    ${opened_in_new_window}    Evaluate    ${countOfWinAft}==${countOfWinBef+1}
    Set Test Variable    ${is_opened_in_new_window}    ${opened_in_new_window}
    Run Keyword If    ${opened_in_new_window}    Switch Window    New
    [Return]    ${opened_in_new_window}
    
Global Click On Link, Validate The Page Title And Content
    [Documentation]    Clicks on a link, and validates the page title and content on Page
    [Arguments]
    ...    ${elementToClick}
    ...    ${verify_page_content}
    ...    ${page_title}=None
    ...    ${run_keyword_on_page}=None
    ...    ${check_for_upsell}=False
    ...    ${page_url}=None
    ...    ${timeout}=${wait_time}
    
    ${response}	   Global Get link Status code     ${elementToClick}    ${timeout}
    ${response_pass}    Run Keyword If    '''None''' == '''${response}'''
    ...            Set Variable    True
    ...    ELSE    Run Keyword And Return Status    Should Match Regexp   ${response}    (200|3\\d{2})
    
    Run Keyword If    ${response_pass} 
    ...		Global Click On Link, Validate Page Navigation		${elementToClick} 	 ${verify_page_content}      ${page_title}      ${run_keyword_on_page}    ${check_for_upsell}    ${page_url}
    ...		ELSE   
    ...		Fail With Failure Details    The Response of the page is : ${response} for ${elementToClick}. Please check it manually.

Global Click On Link, Validate Page Navigation
    [Arguments] 
    ...    ${elementToClick}
    ...    ${verify_page_content}
    ...    ${page_title}
    ...    ${run_keyword_on_page}
    ...    ${check_for_upsell}
    ...    ${page_url}=None
    
    ${opened_in_new_window}    Global Switch Window If Link Opens In New Window    ${elementToClick} 

    Run Keyword And Continue On Failure
    ...    Run Keyword If    '''${page_title}'''!='''None'''
    ...    Title Should Be    ${page_title}
    ${current_url}    Get Location
    Run Keyword And Continue On Failure
    ...    Run Keyword If    '${page_url}'!='None'
    ...    Should Contain    ${current_url}    ${page_url}
    
    Run Keyword And Continue On Failure
    ...    Run Keyword If    '''${verify_page_content}'''!='''None'''
    ...    Wait Until Keyword Succeeds    3x    2s
    ...    Verify Element On Page    ${verify_page_content}
    Run Keyword And Continue On Failure
    ...    Run Keyword If    '${run_keyword_on_page}'!='None'
    ...    Run Keyword    ${run_keyword_on_page}
    
    Run Keyword If    ${opened_in_new_window}
    ...    Close Second Window, Switch Back To Main Window    
    
Global Get link Status Code 
    [Arguments]     ${element_loc}    ${timeout}=${wait_time}
    
    ${is_link_displayed}    Run Keyword And Return Status    Wait Until Keyword Succeeds    3x    2s    
    ...    Wait Until Element Is Visible    ${element_loc}    ${timeout}
    Run Keyword If    ${is_link_displayed}==False    Run Keywords
    ...    Log To Console    Link not displayed - ${element_loc}
    ...    AND    Return From Keyword    False
    ${href_url}    Get Element Attribute    ${element_loc}    href          
    
    ${href_url}    Run Keyword If    'www' in '${href_url}'    Set Variable    ${href_url}
    ...    ELSE IF    '${href_url}'!='None'    Replace String    ${href_url}    https://    https://www.    
    
    Run Keyword And Return    Get The Status Code Of A Link    ${href_url}   

Get The Status Code Of A Link
    [Arguments]    ${link}    ${is_cert_required}=True
    [Documentation]    Gets the response status of a link and returns 
    
    ${is_certificate_verification_required}    Run Keyword If    ${is_cert_required} == False    
    ...    Set Variable    ${certificate_verification_not_required_text}
    ...    ELSE    Set Variable    ${certificate_verification_required_text}    
    ${response}     Get Response Code    ${link}    ${is_certificate_verification_required}
    Sleep    2s           
    Print To Log And Console     Validating Href: ${link}
    Run Keyword If    '''None''' == '''${response}'''
    ...    Log    The Response Code of link: ${link} is None. Please check the Log.    level=WARN
    ...    ELSE       Print To Log And Console     Status Code: ${response}
    ${resp_code}     Convert To String    ${response}
    [Return]    ${resp_code}   

Get Current Date In Pacific Time
    [Arguments]    ${result_format}=timestamp
    [Documentation]    Returns current date in PST.  
    
    ${cur_date_in_pst}    Get Time Based On Timezone    ${timezone_pacific_format}    ${result_format} 
    [Return]    ${cur_date_in_pst}        
    
Open New Tab
    [Arguments]    ${page_url}
    [Documentation]    Opens a new tab and loads the URL.
    
    @{windows}    Get Window Handles
    ${windows_count_old}    Get Length    ${windows}
    Execute Javascript   window.open()
    Sleep    5s
    @{windows}    Get Window Handles
    ${windows_count_new}    Get Length    ${windows}
    
    ${new_tab_opened}    Run Keyword And Return Status
    ...    Should Be True    ${windows_count_old}+1==${windows_count_new}
    
    Run Keyword If    not(${new_tab_opened})
    ...    Fail With Failure Details    New tab is not opened. Please manually.
    
    ${new_tab}    Set variable    ${windows}[-1]
    Select Window    ${new_tab}
    Wait until Keyword Succeeds    2x    2s
    ...    Go To    ${page_url}
    
    [Return]    ${new_tab}

Click Outside The Popup To Close
    [Documentation]    To close few popup's by clicking outside of it on the page
    ...    (Use this for the popup's which doesn't have X button to close)
    
    Execute Javascript    document.elementFromPoint(5, 5).click();

Get The Cookies
    [Documentation]    Returns the cookies as a dictionary
    
    ${cookies}    Create Dictionary
    ${cookies_text}    Execute JavaScript    return document.cookie;
    ${all_cookies}    Split String    ${cookies_text}    ;
    FOR    ${each_cookie}    IN    @{all_cookies}
        ${each_cookie}    Strip String    ${each_cookie}
        ${current_cookie_key_and_value}    Split String    ${each_cookie}    =
        ${current_cookie_key}    Set Variable    ${current_cookie_key_and_value}[0]
        ${current_cookie_value}    Set Variable    ${current_cookie_key_and_value}[1]
        Set To Dictionary 	${cookies} 	    ${current_cookie_key} 	${current_cookie_value}
    END
    [Return]    ${cookies}
    
Verify That New Window Is Opened
    [Arguments]
    ...    ${countOfWinBef}=1
    [Documentation]    verifies that a new window is opened after an action.
    ...    countOfWinBef: Is the number of opened windows before the action.
    
    @{windowsAftClick}     Get Window Identifiers
    ${countOfWinAft}    Get Length    ${windowsAftClick}
    
    Run Keyword Unless    ${countOfWinAft}==${countOfWinBef}+1
    ...    Fail With Failure Details    New Window didnot Open. Please check manually.

Verify Response Of The URL
    [Documentation]    Gets Response code of the given link and verifies it is between 200-399.
    ...    link: URL for which the response code is to be checked.
    
    [Arguments]    ${link}
    
    ${response}    Get The Status Code Of A Link    ${link}
    ${valid_response}    Run Keyword And Return Status    Should Match Regexp   ${response}    ([2,3][0-9][0-9])
    Run Keyword If    ${valid_response}==False
    ...    Fail With Failure Details    The Response of ${link} is : ${response}. Please check it manually. 

Verify Element On Popup And Close It
    [Arguments]    ${verify_element}    ${close_btn}
    [Documentation]    Verifies whether popup exists on the page or not and closes it.
    
    Verify Element On Page    ${verify_element}
    Check Length Of Copy In Element    ${verify_element}
    Global Close Pop Up   ${close_btn} 
    
Run Keyword And Continue On Failure By Logging Error Message
    [Arguments]    ${fail_message}    ${keyword}    ${keyword_args}    
    [Documentation]    Verifies element is present and continues execution by logging failure message.
    
    ${is_element_exists}    Run Keyword And Return Status    
    ...    ${keyword}    ${keyword_args}
    
    Run Keyword If    ${is_element_exists}==False    Run Keyword And Continue On Failure
    ...    Fail With Failure Details    ${fail_message}
    
Get Window Scroll Start Position
    [Documentation]    Get window scroll start position value
    [Return]    ${val}
    
    ${val}    Execute Javascript    return window.startScrollPos

Read Excel Data
    [Documentation]    Read excel data
    [Arguments]    ${filepath}    ${sheetname}

    Open Excel     ${filepath}
    ${rowcount}=        Get Row Count       ${sheetname}
    ${rowcount}=        Convert To Integer  ${rowcount}
    ${colcount}=        Get Column Count       ${sheetname}
    ${colcount}=        Convert To Integer  ${colcount}
    @{dictlist}=        Create List
    &{datadict}=        Create Dictionary
        FOR    ${rowcounter}    IN RANGE    1    ${rowcount}
            ${colname}=       Read Cell Data By Coordinates        ${sheetname}       0       0
            ${cellvalue}=       Read Cell Data By Coordinates        ${sheetname}       0        ${rowcounter}
            Set To Dictionary             ${datadict}       ${colname}      ${cellvalue}
            FOR     ${colcounter}    IN RANGE    1    ${colcount}
                ${colname}=       Read Cell Data By Coordinates        ${sheetname}       ${colcounter}       0
                ${cellvalue}=       Read Cell Data By Coordinates        ${sheetname}       ${colcounter}       ${rowcounter}
                Set To Dictionary             ${datadict}       ${colname}      ${cellvalue}
            END
            Append To List      ${dictlist}     ${datadict}
        END
#        Append To List      ${dictlist}     ${datadict}
    [Return]    ${dictlist}