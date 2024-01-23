*** Settings ***
Documentation    This resource file contains global keywords for checking copy across the framework.

*** Variables ***
${triple_single_quote}    '''
${triple_double_quote}    """
${single_quote}           '

*** Keywords ***

Actual Vs Expected Copy
    [Documentation]    Takes ActualCopy_location where copy is on the page, 
    ...                and validates it against copy. An indefinite 
    ...                number of items can be entered in the Expected argument.
    ...                Alternatively you can enter the copy directly to the ActualCopy_location
    ...                argument and it will validate the copy directly. The function checks for 
    ...                a locator strategy tag in locator_strategy_tag local list, so if the locator 
    ...                strategy is not one listed, you will have to add the new strategy into 
    ...                the list.
    [Arguments]
    ...    ${ActualCopy_location}
    ...    @{Expected_copy}
    
    Verify Element On Page        ${ActualCopy_location}
    ${copyloc_case_insensitive}    Evaluate    '''${Actual_copy_location}'''.lower()

    ${ActualCopy}    Run Keyword If    '''jquery=''' in '''${copyloc_case_insensitive}''' or '''css=''' in '''${copyloc_case_insensitive}'''    
    ...    Get Text    ${ActualCopy_location}
    ...    ELSE    Set Variable    str(${ActualCopy_location})
    Log    ${ActualCopy}
    # ====================
    FOR    ${copy}    IN    @{Expected_copy}
        ${checked_copy}=    Run Keyword and Return Status
        ...    Should Contain    ${ActualCopy}    ${copy}
        Exit For Loop If    ${checked_copy} != True
    END
    Run Keyword If    ${checked_copy}
    ...    Log     Pass: '${ActualCopy}' matches '@{Expected_copy}'
   
    Run Keyword If    ${checked_copy} != True
    ...    Run Keyword And Continue On Failure
    ...    Fail With Failure Details    Fail: '${ActualCopy}' does not match '@{Expected_copy}'
    
Actual Vs Expected Copy Regex
    [Arguments]
    ...    ${ActualCopy_location}
    ...    @{Expected_copy_regex}
    [Documentation]    Takes ActualCopy_location where copy is on the page, 
    ...                and validates it against Expected_copy_regex list. An indefinite 
    ...                number of items can be entered in the Expected argument.
    ...
    ...                Alternatively you can enter the copy directly to the ActualCopy_location
    ...                argument and it will validate the copy directly. The function checks for 
    ...                a locator strategy tag in locator_strategy_tag local list, so if the locator 
    ...                strategy is not one listed, you will have to add the new strategy into 
    ...                the list.
    # ====================
    @{locator_strategy_tag}    Create List    jquery=    css=    xpath=    id=    class=
    # ====================
    # returns entered location or copy in lowercase form to check for locator strategy tag in list.
    ${copyloc_case_insensitive}     Evaluate    '''${ActualCopy_location}'''.lower()
    # ====================
    FOR    ${item}    IN    @{locator_strategy_tag}
       ${checkfor_strategy_tag}    Run Keyword If    '''${item}''' in '''${copyloc_case_insensitive}'''
       ...    Set Variable    True
       ...    ELSE    Set Variable    False
    
        ${checkfor_loc_on_page}    Run Keyword If    ${checkfor_strategy_tag}
        ...    Run Keyword And Return Status    Verify Element On Page    ${ActualCopy_location}
    
        Run Keyword If     ${checkfor_strategy_tag} == True and ${checkfor_loc_on_page} == False
        ...    Fail With Failure Details    ${ActualCopy_location} not found on page. Review screenshot.
    
        ${ActualCopy}    Run Keyword If    ${checkfor_strategy_tag} == True
        ...    Get Text    ${ActualCopy_location}
        ...    ELSE IF     ${checkfor_strategy_tag} == False
        ...    Set Variable    ${ActualCopy_location}
    
        Exit For Loop If    ${checkfor_strategy_tag} == True
    END
    
    FOR    ${regex}    IN    @{Expected_copy_regex}
        ${checked_regex_copy}    Run Keyword and Return Status
        ...    Should Match Regexp    ${ActualCopy}    ${regex}
        ${failed_regex}    Set Variable If    ${checked_regex_copy} != True    ${regex}
        Exit For Loop If    ${checked_regex_copy} != True
    END
    Run Keyword If    ${checked_regex_copy} == True
    ...    Log     Pass: '${ActualCopy}' matches '@{Expected_copy_regex}'

    # In case test is running while getting text dynamically off the website and the
    # regex match fails, this keyword will run.
    Run Keyword If    ${checked_regex_copy} != True and ${checkfor_strategy_tag} == True
    ...    Run Keyword And Continue On Failure
    ...    Fail With Failure Details    Fail: '${ActualCopy}' does not match '${failed_regex}'
    
    # In case test is running by inputting text to match directly without the need for
    # a browser and the regex match fails, this keyword will run.
    Run Keyword If    ${checked_regex_copy} != True and ${checkfor_strategy_tag} != True
    ...    Run Keyword And Continue On Failure
    ...    Fail    Fail: '${ActualCopy}' does not match '${failed_regex}'

Copy Not Present Regex
    [Documentation]    Takes ActualCopy_location where copy is on the page, 
    ...                and validates it not to match against Expected_copy_regex list. An indefinite 
    ...                number of items can be entered in the Expected argument.
    ...
    ...                Alternatively you can enter the copy directly to the ActualCopy_location
    ...                argument and it validates the copy directly.
    [Arguments]
    ...    ${ActualCopy_location}
    ...    @{Expected_copy_regex}
    
    Verify Element On Page        ${ActualCopy_location}

    # below converts locator to lowercase in case jquery tag is not lowercase.
    ${copyloc_case_insensitive}    Evaluate    "${Actual_copy_location}".lower()
    
    ${ActualCopy}
    ...    Run Keyword If    '''jquery=''' in '''${copyloc_case_insensitive}''' or '''css=''' in '''${copyloc_case_insensitive}'''    
    ...    Get Text    ${ActualCopy_location}
    ...    ELSE    Set Variable    str(${ActualCopy_location})
    Log    ${ActualCopy}
    # ====================
    FOR    ${regex}    IN    @{Expected_copy_regex}
          ${checked_regex_copy}=    Run Keyword and Return Status
    ...    Should Not Match Regexp    ${ActualCopy}    ${regex}
          Exit For Loop If    ${checked_regex_copy} != True
    END
    Run Keyword If    ${checked_regex_copy} == True
    ...    Log     Pass: '${ActualCopy}' does not match '@{Expected_copy_regex}'
    Run Keyword If    ${checked_regex_copy} != True
    ...    Run Keyword And Continue On Failure
    ...    Fail With Failure Details
    ...    Fail: '${ActualCopy}' is not supposed to match '@{Expected_copy_regex}'

Actual vs Expected CSS Fontsize
    [Documentation]    Get the Web element's CSS font size
    ...    Compare it with expected Font size
    [Arguments]    
    ...    ${element_loc}        
    ...    ${expected_font_size}    
    ...    ${css_property}=font-size
    
    Verify Element On Page    ${element_loc}
    ${element}    Get WebElement    ${element_loc}
    ${actual_font_size}    Call Method     ${element}     value_of_css_property     ${css_property}
    Compare Two Values Are Equal    ${actual_font_size}     ${expected_font_size}    ignore_case=True

Updated CSS Color By Removing Fourth Parameter
    [Documentation]    Removes fourth parameter from the css color.
    ...                Ex : If ${expected_css_color} is rgba(255,255,244,240), it will return rgb(255,255,244)
    [Arguments]    ${expected_css_color}
    
    @{colorValues}    Get Regexp Matches    ${expected_css_color}    \\d+
    Return From Keyword    rgb\(${colorValues}[0], ${colorValues}[1], ${colorValues}[2]\)

Check Length Of Copy In Element
    [Arguments]    ${actual_copy_loc}    ${exp_length}=20    ${symbol_matcher}=>
    
    [Documentation]    Gets the text copy encased within an element, counts it, and then checks it against
    ...                the expected length with the symbol matcher used.
    ...                symbol_matcher must be entered with actual_copy_loc number as first number. Below are 
    ...                examples:
    ...                actual_copy_loc=10, symbol_matcher=">", exp_length=8: 10 > 8: True
    ...                actual_copy_loc=10, symbol_matcher="<=", exp_length=8: 10 <= 8: False
    ...                actual_copy_loc=10, symbol_matcher="<", exp_length=8: 10 < 8: False
    ...                actual_copy_loc=10, symbol_matcher="==", exp_length=10: 10 == 10: True
    
    Verify Element On Page    ${actual_copy_loc}
    ${get_text}    Get Text    ${actual_copy_loc}
    ${get_text_len}    Evaluate    len('''${get_text}''')
    
    ${check_length_vs_expected}=
    ...    Evaluate    ${get_text_len} ${symbol_matcher} ${exp_length}
    
    Run Keyword If    ${check_length_vs_expected} == False    Run Keyword And Continue On Failure
    ...    Fail With Failure Details    Error found with length of text in element locator ${actual_copy_loc}: ${get_text_len} ${symbol_matcher} ${exp_length} is False. Investigate element by viewing screen shot and going to above URL in failure details.
    ...    ELSE    Log    ${get_text_len} ${symbol_matcher} ${exp_length} is True
    
    RETURN    ${check_length_vs_expected}
    
Compare Two Values Are Equal
    [Arguments]    ${first_value}    ${second_value}    ${msg}=${EMPTY}    ${ignore_case}=False    
    [Documentation]    Compares two strings or integers or numbers. If both are not matched then captures the screenshot and then fails with generic error message
    ...    first_value: actual value to be compared
    ...    second_value: expected value to be compared
    
    ${is_passed}    Run Keyword And Return Status
    ...    Should Be Equal    ${first_value}    ${second_value}    ignore_case=${ignore_case}
    
    Run Keyword And Continue On Failure    Run Keyword If    ${is_passed}==False
    ...    Fail With Failure Details    ${first_value} & ${second_value} are not equal. Check whether the error is with data type or data. ${msg}

Compare Two Values Are Not Equal
    [Arguments]    ${first_value}    ${second_value}    ${msg}=${EMPTY}    ${ignore_case}=False    
    [Documentation]    Compares two strings or integers or numbers. If both are matched then captures the screenshot and then fails with generic error message
    ...    first_value: actual value to be compared
    ...    second_value: expected value to be compared
    
    ${is_passed}    Run Keyword And Return Status
    ...    Should Not Be Equal    ${first_value}    ${second_value}      ignore_case=${ignore_case}
    
    Run Keyword And Continue On Failure    Run Keyword If    ${is_passed}==False
    ...    Fail With Failure Details    ${first_value} & ${second_value} are equal. Check whether the error is with data type or data. ${msg}

Get Text And Strip The Spaces
    [Arguments]    ${loc}
    
    ${text}    Get Text    ${loc}
    ${text}    Strip String    ${text}
    RETURN    ${text}
    
Get Text Using Javascript
    [Arguments]    ${locator}
    [Documentation]    Get the text at the locator using .text() javascripts function.
    
    ${locator_ready}    Remove Element Variable Tag    ${locator}
    ${element_text}    Run Keyword If    '''"''' in '''${locator_ready}'''
    ...    Execute Javascript    return $('${locator_ready}').text();
    ...    ELSE    Execute Javascript   return $("${locator_ready}").text();
    RETURN    ${element_text}
    
Get CSS Property Value
    [Arguments]    ${locator}    ${attribute_name}
	[Documentation]    Get the CSS property value of an element.
    ...    locator: the element whose css property value is required
    ...    attribute_name: CSS Property Name   

    ${css}    Get WebElement    ${locator}
    ${prop_val}    Call Method       ${css}    value_of_css_property    ${attribute name}
    RETURN     ${prop_val}
    
Actual vs Expected CSS Background Color
    [Documentation]    Get the Web element's CSS Background color
    ...    Compare it with expected Background color
    [Arguments]    
    ...    ${element_loc}        
    ...    ${expected_background_color}    
    ...    ${css_property}=background-color
    
    Verify Element On Page    ${element_loc}
    ${element}    Get WebElement    ${element_loc}
    ${actual_background_color}    Call Method     ${element}     value_of_css_property     ${css_property}
    Compare Two Values Are Equal    ${actual_background_color}     ${expected_background_color}    ignore_case=True