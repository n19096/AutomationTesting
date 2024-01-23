*** Settings ***
Documentation     This resource file contains objects to setup the browser.

*** Variables ***
#===========================================================
# Selenium Settings #
#===========================================================
${browser}           gc
# =============================================================
# BROWSER LISTS
# =============================================================
@{browser_ff_name_list}    firefox	    ff	  Firefox
@{browser_gc_name_list}    chrome	    gc    Chrome    googlechrome
@{browser_sf_name_list}    safari
@{browser_eg_name_list}    edge
${browser_name}   
 
# ============================= headless ================================
${browser_gc_headless}    False

# ============================= devices ================================
${desktop}         False
${mobile}          False

# =============================================================
${mobile_emulation}       True
${fake_media_stream}      False
${cap}                    use-file-for-fake-video-capture=

&{log_preferences}        driver=INFO    server=OFF    browser=INFO
&{log_prefs}              loggingPrefs=${log_preferences}
&{test}    profile.default_content_setting_values.media_stream_camera=${1}

*** Keywords ***
Custom Open Browser And Setup
    [Arguments]    ${load_url}=${TEST_URL}    ${alias}=${BROWSER}
    [Documentation]    Sets several crucial test variables to be used for initializing the tests
    ...                based on brand/platform/environment. Optional argument of loading a URL
    ...                other than the test_url if desired, however defaults to test_url since that
    ...                is the common url to load most of the time.
    ...
    ...                One time to use a different URL for this is when running GMS tests along
    ...                with brand URLs, so test_url can remain set as the brand URL and gms can
    ...                have a separate url variable.

    Set Browser
    Set Wait Time Based On Test Environment
    Set Fail Message Details
    Open Browser For Testing    load_url=${load_url}    alias=${alias}
    
Open Browser For Testing
    [Arguments]    ${load_url}=${TEST_URL}    ${alias}=${BROWSER}
    [Documentation]    arg:load_url:
    ...                    defaults to TEST_URL. If desired, a different URL can be entered
    ...                    for opening a browser with. Useful for GMS or Console supportive
    ...                    testing.
    ...                arg:alias:
    ...                    defaults to the browser entered. Can be set to identify a browser,
    ...                    which can be useful if multiple browsers need to be opened and
    ...                    controlled. You can pick the name entered for a browser instance,
    ...                    and can use that alias name to identify it for switching browsers,
    ...                    etc.
    
    Run Keyword If    'GC' != '${browser_name}'
#    ...    Set Chrome Browser     ${TEST_URL}    ${alias}=${BROWSER}
    ...    Open Browser    ${load_url}    ${browser}    alias=${alias}
    ...    ELSE IF    'GC' == '${browser_name}' and ${desktop}
    ...    Set Chrome Options And Open Chrome Browser    load_url=${load_url}    alias=${alias}
    ...    ELSE IF    'GC' == '${browser_name}' and ${mobile}
    ...    Create Mobile Emulation    load_url=${load_url}    alias=${alias}
    maximize browser window
    Set Window Size     ${1920}     ${1080}


Set Chrome Browser
    [Arguments]        ${load_url}    ${alias}
    [Documentation]    Sets various chrome options, then converts them to desired capabilities for
    ...                consumption by the desired_capabilities argument.
    ####################
    # SET CHROME OPTIONS
    ####################

    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
#    Call Method    ${chrome_options}    add_argument    headless
#    Call Method    ${chrome_options}    add_argument    window-size=1920,1080
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Wait Until Keyword Succeeds    3x    1s
    ...    Create WebDriver    Chrome    alias=${alias}    chrome_options=${chrome_options}    desired_capabilities=${log_prefs}
    Set Window Size     ${1920}     ${1080}
    Go To    ${load_url}

Set Chrome Options And Open Chrome Browser
    [Arguments]        ${load_url}=${TEST_URL}    ${alias}=${BROWSER}
    [Documentation]    Sets various chrome options, then converts them to desired capabilities for
    ...                consumption by the desired_capabilities argument.
    ####################
    # SET CHROME OPTIONS
    ####################
    
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-notifications
    Call Method    ${chrome_options}    add_argument    disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    enable-automation
    #Call Method    ${chrome_options}    add_experimental_option    w3c    ${False}    #To make w3c mode false (its is true by defualt from chrome driver 75)
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Call Method    ${chrome_options}    add_argument    disable-setuid-sandbox
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Run Keyword If    ${fake_media_stream}    Run Keywords
    ...    Call Method    ${chrome_options}    add_argument    use-fake-device-for-media-stream        
    ...    AND    Call Method    ${chrome_options}    add_argument    ${cap}${CURDIR}\\ACFakeVideo.y4m
    ...    AND    Call Method    ${chrome_options}    add_experimental_option    prefs    ${test}
    
    ####################
    # SET CHROME TO HEADLESS MODE.
    ####################
    Run Keyword If    ${browser_gc_headless}
    ...    Call Method    ${chrome_options}    add_argument    headless
     
    ####################
    # SEND CHROME OPTIONS TO DESIRED CAPABILITIES
    ####################
    #${desired_caps}=     Call Method     ${chrome_options}    to_capabilities
    #Open Browser    ${test_url}    Remote    alias=${alias}    remote_url=${selenium_grid}    desired_capabilities=${desired_caps}
    
    Wait Until Keyword Succeeds    3x    1s
    ...    Create WebDriver    Chrome    alias=${alias}    chrome_options=${chrome_options}    desired_capabilities=${log_prefs}
    
    ####################
    # If headless mode is on, this sets browser to appropriate resolution. The chrome option "start-maximized" doesn't appear to work when headless mode is on, so this is set specifically here.
    ####################
    Run Keyword If    ${browser_gc_headless}
    ...    Set Window Size    1920   1080
    Go To    ${load_url}


Create Mobile Emulation
    [Arguments]        ${load_url}=${TEST_URL}    ${alias}=${BROWSER}
    [Documentation]     Keyword launches the browser in resized form or in emulation mode for mobile scripts execution

    ${mobile_device_options}    Create Dictionary    deviceName=iPhone 6
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Run Keyword If    ${mobile_emulation}
    ...    Call Method    ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile_device_options}
    Call Method    ${chrome_options}    add_argument    disable-notifications
    Call Method    ${chrome_options}    add_argument    disable-popup-blocking
    Call Method    ${chrome_options}    add_argument    enable-automation
    #Call Method    ${chrome_options}    add_experimental_option    w3c    ${False}    #To make w3c mode false (its is true by defualt from chrome driver 75)
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Call Method    ${chrome_options}    add_argument    disable-setuid-sandbox
    Call Method    ${chrome_options}    add_argument    disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    disable-gpu    
    Run Keyword If    ${browser_gc_headless}
    ...    Call Method    ${chrome_options}    add_argument    headless
    ####################
    # SEND CHROME OPTIONS TO DESIRED CAPABILITIES
    ####################
    #${desired_caps}=     Call Method     ${chrome_options}    to_capabilities
    #Open Browser    ${test_url}    ${BROWSER}    alias=${alias}   remote_url=${selenium_grid}    desired_capabilities=${desired_caps}
    
    Wait Until Keyword Succeeds    3x    1s
    ...    Create WebDriver    Chrome    alias=${alias}    chrome_options=${chrome_options}    desired_capabilities=${log_prefs}
    
    Go To    ${load_url}

Set Variable For Mobile Emulation
    Set Global Variable    ${mobile_emulation}    True    

Set Browser
    [Documentation]    Keyword sets the browser name to a global variable
    
    Run Keyword If    '${BROWSER}' in ${browser_ff_name_list}
    ...    Set Global Variable    ${browser_name}    FF
    ...    ELSE IF    '${BROWSER}' in ${browser_gc_name_list}
    ...    Set Global Variable    ${browser_name}    GC
    ...    ELSE IF    '${BROWSER}' in ${browser_sf_name_list}
    ...    Set Global Variable    ${browser_name}    SAFARI
    ...    ELSE IF    '${BROWSER}' in @{browser_eg_name_list}
    ...    Set Global Variable    ${browser_name}    EG

Custom Reset Browser
    [Documentation]    Will go through the reset commands that are typically run between tests,
    ...                typically as a test teardown.      
    
    Run Keyword And Ignore Error    Handle Alert    timeout=1  #In case there is a pop up alert that failed the test, this should close it so tests running after this test don't get affected.
    Run Keyword And Ignore Error    Switch Browser   ${1}
    Run Keyword And Ignore Error    Switch Window
    Repeat Keyword       5 times       Delete All Cookies
    Go To     ${TEST_URL}


Custom Reset Browser For Test
    [Documentation]    Closes current test window and resets main browser window.    
    
    Run Keyword And Ignore Error    Handle Alert    timeout=1  #In case there is a pop up alert that failed the test, this should close it so tests running after this test don't get affected.
    Close Window
    Run Keyword And Ignore Error    Switch Browser   ${1}
    Run Keyword And Ignore Error    Switch Window
    Go To     ${TEST_URL}
    Delete All Cookies

Close Browser Window
    Close All Browsers
    
Desktop Test
    Set Global Variable    ${desktop}    True

Mobile Test
    Set Global Variable    ${mobile}     True    
    