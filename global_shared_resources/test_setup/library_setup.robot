*** Settings ***
Documentation     This file contains objects to import libraries and resource files.

###################
# Library imports #
###################
#Library     SeleniumLibrary
Library     String
Library     Screenshot
Library     Collections
Library     RequestsLibrary
Library     DateTime
Library     JSONLibrary
Library     Process
Library     OperatingSystem
#Library     ExcelLibrary

###################
# Custom Library imports #
###################
Library     ../zpylib/ConvertStringToJson.py
Library     ../zpylib/GetStatusCode.py
Library     ../zpylib/GlobalCustomRegex.py
Library     ../zpylib/GlobalDateTime.py
Library     ../zpylib/SeleniumFunctions.py
Library     ../zpylib/SendingEmails.py
Library     ../zpylib/StringKeywords.py
Library     ../zpylib/TimeFunctions.py
Library     ../zpylib/ActionsOnElement.py

# ###################
# # Test Setup files #
# ###################
Resource    browser_res_setup.robot
Resource    browser_setup.robot
Resource    misc_setup.robot
Resource    timeout_setup.robot

# ###################
# # Custom Function files #
# ###################
Resource    ../custom_functions/global_copyreview.robot
Resource    ../custom_functions/global_element_functions.robot
Resource    ../custom_functions/global_helper_functions.robot
