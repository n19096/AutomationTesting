*** Settings ***
Documentation    Miscellaneous keywords.
Resource    library_setup.robot

*** Variables ***

*** Keywords ***
Set Fail Message Details
    Register Keyword To Run On Failure    Failure Details

Failure Details
    Log Title
    Log Location
    Capture Page Screenshot

