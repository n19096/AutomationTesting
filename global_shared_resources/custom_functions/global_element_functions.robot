*** Settings ***
Documentation    This resource file contains global keywords for element actions across the framework.
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Find, Scroll To And Click Element
    [Arguments]
    ...    ${element}
    ...    ${timeout}=${wait_time}
    ...    ${validate_elementvisible}=None
    ...    ${element_goneafterclick}=False
    ...    ${click_delay}=0.5
    ...    ${scrollNumber}=250
    [Documentation]
    ...    >Element waits to be visible and then executes javascript to scroll slightly above
    ...    the element. This is particularly useful when a top nav overlaps with an element.
    ...    >>The function then waits half a second before clicking on the element.
    ...    >Timeout is the amount of time the function waits for the element to be visible.
    ...    >If validate_elementvisible is entered, the function will perform a validation check to 
    ...    ensure the expected element is present in the DOM of the page and is also visible.
    # =========================
    Javascript Scroll Up On Page    ${element}    ${timeout}    scrollUpNumber=${scrollNumber}
    Sleep    ${click_delay}
    Find And Click Element
    ...    ${element}
    ...    ${timeout}
    ...    ${validate_elementvisible}
    ...    ${element_goneafterclick}

Find And Click Element
    [Arguments]
    ...    ${element}
    ...    ${timeout}=${wait_time}
    ...    ${validate_elementvisible}=None
    ...    ${element_goneafterclick}=False
    [Documentation]
    ...    >Element waits to be visible and then clicks on element.
    ...    >Timeout is the amount of time the function waits for the element to be visible.
    ...    >If validate_elementvisible is entered, the function will perform a validation check to 
    ...    ensure the expected element is present in the DOM of the page and is also visible.
    ...    >If element_goneafterclick is passed as True, verifies the element is not appearing after click.

    # =========================
    Wait Until Element Is Visible    ${element}    ${timeout}
    Wait Until Keyword Succeeds    2x    1s    Click Element    ${element}
    # =========================
    ${half_timeout}    Evaluate    ${timeout}/2
    Run Keyword If    ${element_goneafterclick}
    ...    Wait Until Keyword Succeeds
    ...    2x    1s    Element Gone Or Not Visible    ${element}    timeout=${half_timeout}
    
    Run Keyword If    '''${validate_elementvisible}'''!='''None'''
    ...    Verify Element On Page    ${validate_elementvisible}
    
Click All Elements Of Same Locator 
    [Documentation]    Clicks on all elements which are matched with locator after splitting comma separated values present in locator.
    ...                If ${element} is jquery=.hello, .world, then it will attempt to click on all available elements with .hello and .world. 
    [Arguments]    ${element}    ${timeout}=${wait_time}    ${element_goneafterclick}=False
    
    ${element_list}    split_string_using_regex    ${element}

    Register Keyword To Run On Failure    Nothing
    FOR    ${new_element}    IN    @{element_list}
        ${get_var_count}    Get variable count    ${new_element}
        Run Keyword If    ${get_var_count} > 0
        ...    Run Keyword And Ignore Error
        ...    Click All Elements    jquery=${new_element}    ${get_var_count}    ${timeout}    element_goneafterclick=${element_goneafterclick}
    END
    
    Set Fail Message Details
    
Click All Elements    
    [Documentation]    Clicks on all available elements with locator ${element}.
    [Arguments]    ${element}    ${num_count}    ${timeout}=${wait_time}    ${element_goneafterclick}=False
    
    FOR    ${num}    IN RANGE    0    ${num_count}
        ${click_element}    Run Keyword And Return Status    Find, Scroll To And Click Element    ${element}:eq(${num})    ${timeout}    element_goneafterclick=${element_goneafterclick}
    END

Find And Click Element Using Javascript
    [Arguments]    ${element}
    [Documentation]    In rare cases, Selenium has difficulties clicking on elements. This is a custom jquery alternative, but should only be used if "Find And Click Element" cannot be used.
    
    Wait Until Element Is Visible    ${element}
    ${element_ready}    Remove Element Variable Tag    ${element}
    
    Run Keyword If    '''"''' in '''${element_ready}'''
    ...    Execute Javascript    $('${element_ready}').click();
    ...    ELSE    Execute Javascript    $("${element_ready}").click();

Hover Mouse    [Arguments]    ${element}    ${count}=2    ${js_scroll}=False 
    [Documentation]    js_scroll optional function added because FF gecko driver has issues with hovering over elements not physically visible in the browser window. This should scroll to the element first to bring it into view before attempting to mouse over it. 6/24/2017 addition - CMcCue
    # ==========
    ${lower_count}    Evaluate    ${count}-1
    # ==========
    Wait Until Keyword Succeeds    2x    2s
    ...    Wait Until Element Is Visible  ${element}    ${wait_time}
    # ==========
    Run Keyword If    ${js_scroll}
    ...    Javascript Scroll to Element    ${element}
    ${mouse_over}    Run Keyword And Return Status
    ...    Mouse Over    ${element}
    # ==========
    Run Keyword If    not(${mouse_over}) and ${lower_count} > 0
    ...    Hover Mouse    ${element}    count=${lower_count}    js_scroll=True
    
Mouse Click    [Arguments]    ${element}
    SeleniumLibrary.Mouse Down                ${element}
    SeleniumLibrary.Mouse Up                  ${element}

Select Random Clickable Answer
    [Arguments]
    ...    ${element}
    ...    ${count}=1
    ...    ${delay}=0.5
	# ====================
    ${element_count}    Get variable count    ${element}
    Run Keyword If    ${element_count} == 0
    ...    Fail With Failure Details    The element ${element} you are looking for was not found on the page. The element location may have been changed by the development team or it may have been removed. Check page for more details.
    ...    ELSE    Create List To Generate Random Variable    ${element_count}
    ${selected_option_num}=    Run Keyword If    ${element_count} > 0
    ...    Select Clickable Answer    
    ...    ${element}    ${count}    ${delay}
    [Return]    ${selected_option_num}
    
Select Clickable Answer
    [Arguments]
    ...    ${element}
    ...    ${count}=1
    ...    ${delay}=0.5
    [Documentation]
    ...    'element' is the element to be clicked on. The element should be a locator
    ...    that can locate all possible clickable elements and then select a random 
    ...    one. 
    ...    'count' is the number of elements to click. In some cases, a slide or 
    ...    content can select multiple elements. For example, putting the 'count' as 
    ...    3 will select 3 elements. If no 'count' is input, it defaults to 1 element 
    ...    to click. 
    ...    The 'delay' is a number value that provides a slight delay after randomizing 
    ...    the element(s) and then clicking on them. Delay is defaulted to 0.5 seconds if no input is given.
    # ===================
    ${lower_count}=    Evaluate    ${count} - 1
    # ===================
    ${random}=    Evaluate    random.choice(${num_list})    random
	# ===================
    Sleep    ${delay}
    Find, Scroll To And Click Element    ${element}:eq(${random})
    # ===================
    ${check_list_length}=    Get Length    ${num_list}
    Run Keyword If
    ...    ${lower_count} > 0 and ${check_list_length} > 1
    ...    Remove Values From List    ${num_list}    ${random}	
	Run Keyword If
    ...    ${lower_count} > 0 and ${check_list_length} > 1
	...    Select Random Clickable Answer    ${element}    ${lower_count}
    Run Keyword If
    ...    ${lower_count} > 0 and ${check_list_length} <= 1
    ...    Log To Console    Not enough items in the element count list to click on the designated number requested.
    [Return]    ${random}
    
Select dropdown menu answer
    [Documentation]
    ...    >"element" is the main menu element that holds the subelements in it.
    ...    >"option_subelement" is used for counting the number of subelements. It
    ...    defaults to "option" in the jquery string since that is most commonly used
    ...    in the HTML.
    ...    >"select_element_value" can be used if an specific option in the dropdown menu
    ...    wants to be selected instead of a random one by value. Since normally we want a random
    ...    one, this defaults to "None."
    ...    >"select_element_text" can be used if an specific option in the dropdown menu
    ...    wants to be selected instead of a random one by text/label. Since normally we want a random
    ...    one, this defaults to "None."
    ...    >"range_start" is used for selecting where to start when randomizing the 
    ...    subelement selector. Since the "0" subelement is usually a non-selectable 
    ...    option, this defaults to "1."
    ...    >"skip_menu_check" is an option that can skip the menu element visual ID check
    ...    on the page. Normally we want this to make sure it's visible on the page 
    ...    before we interact with it, however in some cases, the literal menu element 
    ...    that houses the subelements is overlapped by an invisible element and can cause
    ...    issues with the automation driver. If this issue arises, setting this to 
    ...    "True" will skip that check. It defaults to "False."
    [Arguments]
    ...    ${element}
    ...    ${option_subelement}=option
    ...    ${select_element_value}=None
    ...    ${select_element_text}=None
    ...    ${range_start}=1
    ...    ${skip_menu_check}=False
    # ====================
    Run Keyword If    ${skip_menu_check} == False
    ...    Wait Until Element Is Visible    ${element}
    ${element_count}    Get variable count    ${element} ${option_subelement}
    # ====================
    ${random}=
    ...    Run Keyword If    ${element_count} > ${range_start}
    ...    Evaluate
    ...    random.randint(${range_start}, (${element_count}-1))    random
    ...    ELSE    Evaluate    ${element_count}-1
    ${random_int}
    ...    Convert To String    ${random}
    # ====================
    Run Keyword If    ${element_count} == 0
    ...    Log To Console    The element you are looking for was not found on the page. The element location may have been changed by the development team or it may have been removed. Check page for more details.
    ...    ELSE IF    
    ...    '${select_element_value}'=='None' and '${select_element_text}'=='None' and ${element_count} > 0
    ...    Select From List By Index    ${element}    ${random_int}
    ...    ELSE IF    
    ...    '${select_element_value}'!='None' and '${select_element_text}'=='None' and ${element_count} > 0
    ...    Select From List By Value    ${element}    ${select_element_value}    
    ...    ELSE IF    
    ...    '${select_element_value}'=='None' and '${select_element_text}'!='None' and ${element_count} > 0
    ...    Select From List By Label     ${element}    ${select_element_text}
    ${selected_option}    Get Selected List Label    ${element}
    [Return]    ${selected_option}
    
Verify Element On Page
    [Arguments]
    ...    ${element}
    ...    ${timeout}=${wait_time}
    # =========================
    ${half_timeout}    Evaluate    ${timeout}/2
    # =========================
    Wait Until Keyword Succeeds    2x    2s
    ...    Wait Until Page Contains Element   ${element}    ${half_timeout}
    Wait Until Element Is Visible      ${element}    ${timeout}
    Element Should Be Visible          ${element}
    
Verify Element Not On Page
    [Arguments]
    ...    ${element}
    ...    ${timeout}=${wait_time}
    Wait Until Element Is Not Visible    ${element}    ${timeout}
    Element Should Not Be Visible        ${element}  
    
Verify Any Entered Element On Page
    [Arguments]    @{elements}
    [Documentation]    Takes a list of any number of elements, and verifies at least one of them is visible on the page. If none are visible, the keyword fails.
    
    FOR    ${element}    IN    @{elements}
        Register Keyword To Run On Failure    Nothing
        ${element_visible}=    Run Keyword And Return Status
        ...    Verify Element On Page    ${element}    0.5  
        Run Keyword If    ${element_visible} != True    Log
        ...    ${element_visible}: page does not contain ${element}
        ${element}=    Set Variable If    ${element_visible} == True    ${element}
        Exit For Loop If    ${element_visible} == True
    END    
    
    Set Fail Message Details
    Run Keyword If    ${element_visible} == True     Log     ${element_visible}: ${element} is visible on the page, out of the element list entered for review: @{elements}
    Run Keyword If    ${element_visible} != True     Run Keyword And Continue On Failure
    ...    Fail With Failure Details    ${element_visible}: page did not contain any of the entered elements: @{elements}

Element Gone Or Not Visible
    [Arguments]    ${element}    ${timeout}=${wait_time}
    
    ${elementgone_firstcheck}=
    ...    Run Keyword And Return Status
    ...    Wait Until Element Is Not Visible    ${element}    ${timeout}
    Run Keyword If    ${elementgone_firstcheck}==False
    ...    Wait Until Page Does Not Contain Element    ${element}    2
    # =========================

# This function was written because Chrome was having difficulties finding elements on the page,
# where the element would be just out of the visible browser window.  This scrolls down a little on 
# the page after inputting the base element that you want to scroll down from.
Javascript Scroll Down On Page  
    [Documentation]    Gets vertical position of element and scrolls down on page by a little above than its actual location.
    [Arguments]  ${base element}
    
    Wait Until Element Is Visible    ${base element}
    ${base_element_location}        Get Vertical Position    ${base element}
    #Log    ${base_element_location}
    ${converted number}    Convert To Integer    ${base_element_location} 
    #Log    ${converted number}
    ${add}    Evaluate    ${converted number} + 5 
    #Log    ${add}
    Execute Javascript    return window.scrollTo(0,${add})

Javascript Scroll Up On Page
    [Documentation]    Gets vertical position of element and scrolls up on page upto its location.
    [Arguments]
    ...    ${base element}
    ...    ${timeout}=${wait_time}
    ...    ${scrollUpNumber}=250

    Wait Until Element Is Visible    ${base element}    ${timeout}
    ${base_element_location}    Get Vertical Position    ${base element}
    Log    ${base_element_location}
    ${converted number}    Convert To Integer  ${base_element_location}
    Log    ${converted number}
    ${sub}    Evaluate    ${converted number} - ${scrollUpNumber}
    Log    ${sub} 
    Execute Javascript    return window.scrollTo(0,${sub})
    Sleep	0.1

Javascript Scroll To Item In Nav
    [Documentation]    Gets vertical position of element and scrolls up to its location with respect to ${nav_to_scroll}.
    [Arguments]
    ...    ${base element}
    ...    ${nav_to_scroll}
    ...    ${scrollUpNumber}=0
    # =====================
    ${nav_to_scroll_tagRemoved}
    ...    Remove Element Variable Tag    ${nav_to_scroll}
    # =====================
    Wait Until Page Contains Element    ${base element}
    ${base_element_location}
    ...    Get Vertical Position    ${base element}
    ${base_element_check}    Evaluate    ${base_element_location} - ${scrollUpNumber}
    # =====================
    Log    ${scrollUpNumber}
    Log    ${base_element_check}
    # =====================
    Run Keyword If    '''"''' in '''${base_element_check}'''
    ...    Execute Javascript
    ...    $('${nav_to_scroll_tagRemoved}').scrollTop(${base_element_check})
    ...    ELSE    Execute Javascript
    ...    $("${nav_to_scroll_tagRemoved}").scrollTop(${base_element_check})
    
Javascript Scroll to Element    
    [Documentation]    Gets vertical position of element and scrolls down on page upto its location.  
    [Arguments]    ${base element}
    
    Wait Until Element Is Visible              ${base element}
    ${base_element_location}    Get Vertical Position    ${base element}
    Log    ${base_element_location}
    ${converted number}    Convert To Integer  ${base_element_location}
    Log    ${converted number}
    Execute Javascript    return window.scrollTo(0,${converted number})
    
Click Element Until It Disappears
    [Documentation]    This keyword clicks on element until it is disappeared
    [Arguments]    ${element}    ${max_clicks}=2   ${interval}=1s 
    
    ${lower_count}    Evaluate    ${max_clicks}-1
    Click Element    ${element}
    ${element_exists}    Run Keyword And Return Status    Verify Element On Page    ${element}
    Sleep    ${interval}    
    Run Keyword If    ${element_exists} and ${lower_count} > 0
    ...    Click element until it disappears    ${element}    ${lower_count}    ${interval}
    ...    ELSE IF    ${element_exists} and ${lower_count} <= 0 
    ...    Fail With Failure Details    Automation tried to click : ${element} but failed.      

Click Element at Given Position
    [Documentation]    This Keyword will perform click operation on element at given co-ordinates.
    ...                Assuming center of locator as (0,0) it will calculate the position of given co-ordinates.
    [Arguments]    ${element}    ${x_offset_from_center}=None    ${y_offset_from_center}=None
    
    ${element_ready}    Remove Element Variable Tag    ${element}
    
    ${width}    ${height}    Run Keyword If    '${x_offset_from_center}' == 'None' and '${y_offset_from_center}' == 'None'     
    ...    Get Element Size    ${element}
   
    ${x_offset_from_center}    Run Keyword If    '${x_offset_from_center}' == 'None'
    ...    Evaluate    ${width}*4/5 - ${width}   
    ${y_offset_from_center}    Run Keyword If    '${y_offset_from_center}' == 'None'
    ...    Evaluate    ${height}*4/5 - ${height}   
    
    Wait Until Element Is Visible    ${element}    
    Click Element At Coordinates    ${element}    ${x_offset_from_center}    ${y_offset_from_center}    

Handle And Verify Alert
    [Documentation]    Accepts the alert and compares alert message against ${expected_copy_regex}.
    [Arguments]    ${expected_copy_regex}=None    ${action}=ACCEPT        

    ${alert_message}    Handle Alert    action=${action}
    Run Keyword Unless    '''${expected_copy_regex}''' == '''None'''    
    ...    Actual Vs Expected Copy regex    ${alert_message}    ${expected_copy_regex}     
    
Javascript Scroll To Item In Nav For React
    [Documentation]    Gets vertical position of element and scrolls up to its location with respect to ${nav_to_scroll}.    
    [Arguments]
    ...    ${base element}
    
    ${nav_to_scroll_tagRemoved}
    ...    Remove Element Variable Tag    ${base element}
    
    Wait Until Page Contains Element    ${base element}
    
    Run Keyword If    '''"''' in '''${nav_to_scroll_tagRemoved}'''
    ...    Execute Javascript
    ...    document.querySelector('${nav_to_scroll_tagRemoved}').scrollIntoView(true)
    ...    ELSE    Execute Javascript
    ...    document.querySelector("${nav_to_scroll_tagRemoved}").scrollIntoView(true)
    
    Sleep    0.5s

Click Element Using Javascript For React
    [Arguments]    ${element}
    [Documentation]    In rare cases, Selenium has difficulties clicking on elements. This is a custom jquery alternative, but should only be used if "Find And Click Element" cannot be used. Also, this particular click function does not verify that the element the user is attempting to click on is visible, so I would recommend using Find And Click Element Using Javascript before trying to use this keyword, if possible.
    
    ${element_ready}=    Remove Element Variable Tag    ${element}
    
    Run Keyword If    '''"''' in '''${element_ready}'''
    ...    Execute Javascript
    ...    document.querySelector('${element_ready}').click();
    ...    ELSE    Execute Javascript
    ...    document.querySelector("${element_ready}").click();

Select Random Option And Add To Dictionary
     [Documentation]    checkbox, swatches
     [Arguments]    ${ele_loc}    ${mydict}    ${key_name}
     
     ${optionselected}    Get Random Option From List And Click Element   ${ele_loc}  
     ${optionselected_str}   Convert To String      ${optionselected}
     Set to Dictionary    ${mydict}  ${key_name}    ${optionselected_str}   

Select Dropdown Random Option And Set To Dictionary
     [Documentation]    Select a random dropdown option and set to dictionary.
     [Arguments]    ${ele_loc}    ${dd_option_loc}   ${mydict}    ${key_name}     ${start_range}=0
     
     Find And Click Element     ${ele_loc}
     ${random_num}    Generate Random Number For The Locator    ${dd_option_loc}     ${start_range}
     ${optionselected_str}    Get Text    ${dd_option_loc}:eq( ${random_num})
     Find And Click Element    ${dd_option_loc}:eq( ${random_num})
     Set to Dictionary    ${mydict}  ${key_name}    ${optionselected_str}   
         
Get Random Option From List And Click Element
    [Arguments]     ${ele_loc}     ${start_range}=0
    [Documentation]   Select a random option from webelement list and click on it.
   
    ${random_number}    Generate Random Number For The Locator    ${ele_loc}    ${start_range}
    Find, Scroll To and Click Element       ${ele_loc}:eq(${random_number})
    ${innerText}    Get Text    ${ele_loc}:eq(${random_number})  
    [Return]   ${innerText}      

Generate Random Number For The Locator
    [Arguments]    ${loc}    ${start_range}=0
    [Documentation]    Return a random option from webelement list.
   
    Verify Element On Page    ${loc}
    @{elements}    Get WebElements    ${loc}
    ${countOfElements}    Get Length    ${elements}
    ${randomNum}    Evaluate    random.randint(${start_range},${countOfElements}-1)    random   
    [Return]    ${randomNum}

Choose File From Desktop

    [Arguments]
    ...    ${element}
    ...    ${fileloc}
    # =========================
    Wait Until Page Contains Element    ${element}      20
    Choose File     ${element}     ${fileloc}
#    Click Element    ${element}

#Upload File from Desktop using Autoit
#    [Arguments]
#    ...    ${element}
#    ...    ${fileloc}
#    # =========================
#         Hover Mouse    ${element}
#         Wait Until Keyword Succeeds        2min        5sec        Click Element    ${element}
#         AutoItLibrary.Wait For Active Window    Open    ${SPACE}       #Wait to "Open" window appear.
#         AutoItLibrary.Control Set Text    Open    ${SPACE}    Edit1    ${fileloc}    #Sending filename (with path) to inputfield
#         AutoItLibrary.Control Click    Open    &Open    Button1        #Click on OPEN Button (Submit)


Compare Actual Element text and expected text
    [Arguments]     ${ele}     ${exp_text}
    [Documentation]   Compares Element text with expected text and fails if not equal

    Wait Until Page Contains Element       ${ele}       20
    ${act_text} =         Get Text And Strip The Spaces        ${ele}
    Should Be Equal As Strings    ${act_text}    ${exp_text}