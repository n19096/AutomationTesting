*** Settings ***
Documentation    This file contains the keywords to set the resolution of the screen as per requirement.
Resource    library_setup.robot

*** Variables ***


*** Keywords ***
## ***************************************************************
## RESOLUTION SETTINGS
## ***************************************************************
User Loads Desktop Resolution
    Maximize Browser Window

User Loads Mobile Portrait Resolution
    Set Window Size    400    800
    Sleep    2

User Loads Mobile Landscape Resolution
    Set Window Size    568    320
    Sleep    2

User Loads Tablet Portrait Resolution
    Set Window Size    768    1024
    Sleep    2

User Loads Tablet Landscape Resolution
    Set Window Size    1024    768
    Sleep    2

Force Small Portrait Resolution
    Set Window Size    400    700
    Sleep    2