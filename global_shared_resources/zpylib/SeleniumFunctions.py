from robot.libraries.BuiltIn import BuiltIn

def check_the_errors_from_browser_logs():
    '''    Gets all the info displayed in console tab of developer tool bar and returns errors'''
    
    selib=BuiltIn().get_library_instance('seleniumLibrary')
    driver=selib._current_browser()
    browser_logs= driver.get_log('browser')

    
    all_console_errors= [str(each_log.pop('message')) for each_log in browser_logs if 'INFO' in str(each_log) or 'Info' in str(each_log) or 'info' in str(each_log)]
    return all_console_errors;