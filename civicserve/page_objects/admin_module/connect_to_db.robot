*** Settings ***
Documentation    This file contians page objects for projects page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot

Library    DatabaseLibrary
Library    Collections

*** Variables ***
${DBName}       CivicServe-Test
#CivicServe-Dev
${DBUser}  C!!v!!c33erv$!IO
${DBPassword}  ()8uuICivicServUs3rr23!!@
${DBHost}  dev.civicserve.com
${DBPort}  1433

*** Keywords ***
DB: Connect DB
    Connect To Database  pymssql  ${DBName}  ${DBUser}  ${DBPassword}   ${DBHost}   ${DBPort}

DB: Disconnect DB
    Disconnect From Database

DB: Read Data from Db for Audit tab
    [Arguments]     ${proj_name}
    ${dboutput} =     Query         select FORMAT(A.ActivityDate,'M/d/yyyy') as AuditDate,A.Description,U.FirstName+' '+U.LastName as Name from [General].[ActivityLogs] A join dbo.ASPNetUsers U on A.CreatedBy=U.Id where ProjectId in (Select Id from Projects.Projects where Name like '%${proj_name}%' and isDeleted = 0) and A.ActivityLogType=13 order by A.ActivityDate Desc;
    @{dboutput} =     Convert To List     ${dboutput}
    Log To Console      ${dboutput}
    RETURN    @{dboutput}

DB: Read Data from Db for Correspondence tab notes section
    [Arguments]     ${proj_name}
   ${output} =    Query         select CONVERT(varchar, A.ActivityDate, 101) as AuditDate,A.Description,A.AdditionalData,Case When A.AllowBusinessUsersToView=1 Then 'Yes' Else 'No' End as VisibleToApplicant ,U.FirstName+' '+U.LastName as Name from [General].[ActivityLogs] A join dbo.ASPNetUsers U on A.CreatedBy=U.Id where ProjectId in (Select Id from Projects.Projects where Name like '%${proj_name}%' and isDeleted = 0) and A.ActivityLogType=12 order by A.ActivityDate Desc;
    Log To Console      ${output}
    Log    ${output}

DB: Delete Government Admin User Data from Db
    [Arguments]     ${user_name}
    Execute Sql String         delete from [dbo].[MunicipalityUsers] where UserId in (select Id from [dbo].[AspNetUsers] where email='${user_name}')
    Execute Sql String         delete from [dbo].[AspNetUsers] where email='${user_name}'

DB: Delete Public User Data from Db
    [Arguments]     ${user_name}
    Execute Sql String         delete from [dbo].[MunicipalityUsers] where UserId in (select Id from [dbo].[AspNetUsers] where email='${user_name}')
    Execute Sql String         delete from [General].[Contacts] where UserId in (select Id from [dbo].[AspNetUsers] where email='${user_name}')
    Execute Sql String         delete from [dbo].[AspNetUsers] where email='${user_name}'
