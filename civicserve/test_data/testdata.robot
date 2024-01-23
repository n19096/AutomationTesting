*** Settings ***
Documentation     Test Data file contains test data.

*** Variables ***

#----------------Common Data----------------------
${admin_username}    civicserve@techigai.io
${admin_password}    CivicServ#1
${dev_username}    tammy@cstenant.com
${dev_password}    CivicServ#1
${dev_invalidusername}    test@gmail.com
${dev_invalidpassword}    TGtest
${exp_admin_profile_name}      Techigai Users
${exp_profile_name}      Tammy Tenant

${exp_profile_name1}      shilpa test
${exp_developerheader_text}     Development City
${exp_businessheader_text}     Development City
${exp_app_his_text}             Application History
${exp_bus_text}            Businesses
${exp_comm_text}            Account & Communication
${exp_active_text}          Approved Project
${exp_inactive_text}          Denied Application
${exp_pending_approval_text}          Pending Approval
${exp_closed_text}          Closed Project
#------test site------------
${test_admin_username}    testteamamin@mailinator.com
${test_admin_username1}    test.civicserve@gmail.com
#civicserve@techigai.io
${test_admin_password}    CivicServe#1
${test_dev_username}    rajesh.dev@mailinator.com
#shilpa.dev@mailinator.com
${test_dev_password}    CivicServe#1
${test_exp_admin_profile_name}      Test Team CS Admin
${test_exp_admin_profile_name1}      test civicserve
#Techigai Users
${test_exp_profile_name}      Rajesh Donepudi
#shilpa test
${test_exp_applicant_name}      Rajesh Donepudi
#shilpa
${test_dev_username1}    test.civicserve2@gmail.com
${test_dev_password1}    CivicServe#1
${test_exp_profile_name1}      test civicserve2

#---------Program Creation test data---------------

${ttif_program_name}        Test Create TIF Program
#Edit Program
${tprogram_name}        Test Program
#ARPA Business Resiliency Program

#General Info
#Tax Incentive Financing
${tdescription_text}              Business Program Description
${tshrt_description_text}         Business Program short Description
${tcont_info_text}               Please Contact for any help
${tstrt_dt}                     10/20/2022, 4:58 PM
${tend_dt}                      10/10/2023, 4:58 PM

#Policies
${tpolicy_name1}     Project Eligibility
${tpolicy_desc1}     A Project is eligible for grant fund reimbursement
${tpolicy_name2}     Policies
${tpolicy_desc2}     Site Appearance Grant
${tpolicy_name3}     Project Approval & Grant Reimbursement
${tpolicy_desc3}     Project will be processed on a “first come- first served” basis
${tpolicy_name4}     Pre Application Checklist
${tpolicy_desc4}    Rear and Side Improvements


#Application steps
${tapplication_step_name1}           Developer Information
${tapplication_desc1}                Developer Information
${tprogram_type1}        Applicant Information
${tapplication_step_name2}        Project Details
${tprogram_type2}           Proposed Project Information
${tapplication_step_name11}        Project Details
${tprogram_type11}           Project Details
${tapplication_step_name3}           Property Information
${tprogram_type3}        Property Information
${tapplication_step_name4}           Eligible Costs
${tprogram_type4}        Eligible Costs
${tapplication_step_name5}      Estimated Timeline
${tprogram_type5}       Estimated Timeline
${tapplication_step_name6}           Financing Details
${tprogram_type6}        Sources of Funds
${tapplication_step_name7}           Projections
${tprogram_type7}        Projections
${tapplication_step_name8}           Parties
${tprogram_type8}        Party Information
${tapplication_step_name9}           Documentation Collection
${tprogram_type9}        Documentation Collection
${tapplication_step_name10}           Declarations
${tprogram_type10}        Declarations
${tapplication_step_name12}        Demographic Info
${tprogram_type12}           Project Details

${tstep_proj_det}       Project Details


#notification settings
${tnotification_event_type_name}        Application - Signature Requested
${tusers_to_notify}             shilpa.vagaroor@techigai.io
${tsub}                     test subject
${theading}                 test heading
${tbody}                    test body

#applicant info

${ttarget_aud_option}     Everyone

#Party
${tparty_name}      Test Party

#Districts
${tdistrict_name}       North Main St TIF
${tdistrict_name1}       Downtown District

#Funding Sources
${tfund_name}       Test Fund
${tfund_desc}       Test Fund Desc
${tfund_cat_name}       Test Fund Cat Name

#Eligible Costs
${tec_name}         Test eligible costs
${tec_desc}         Test eligible costs description
${tec_categories_name}          Test eligible costs categories name



#Eligible Construction Activity
${telg_name}        Test Eligible Construction Activity Name
${telg_type_option}     Exterior
${telg_type_checkbox}     ADA Accessibility
${telg_desc}        Test Eligibe Construction Activity Desc

#Program Classification Category
${tprgm_classfn_cat}        Amenities

#Delete Program
${tprog_name}       Growth City Loan Program

#----------------------------------------------------

#--------------------Projects Test Data-----------------

#Create Project
#${tproj_name}       Test Creating Project 1
${tproj_desc}       Test Project Desc
${tproj_name1}       Test Project Create 1

${tsearch_ip}       320 S Tesla Cafe
${tsearch_ip1}       Test New Project
${tsearch_ip3}      202 Main St
${tsearch_ip4}      test proj
${tproj_name_ip5}      Hotel Riviera

${texist_proj_status1}      Pending Submission
${texist_proj_status2}      Pending Approval
${texist_proj_status3}      Approved Project
${texist_proj_status4}      Denied Application
${texist_proj_status5}      Abandoned

${tincentive_program}             Test Program
${tincentive_program1}             Tax Increment Financing (TIF) Program
${tproj_district}       Downtown District
${tproj_buss}       new business
${tproj_ind}        Rajesh

${tapproval_status_text}        Pending Submission

#Approve Project
${tdate_project_opened}     8/18/2023
${testimated_closed_date}       8/18/2024
${tmax_approved_amt}        3242

#Deny Project
${tdate_project_denied}     8/18/2023
${tdenied_note}     test deny

#Close Project
${tdate_project_closed_out}     2/23/2023

#Reading Project Details
#Project Info
${tprog_or_dist_name}           Tax Increment Financing (TIF) Program/Downtown District
#TIF/TIF District No. 35
${tapplication_status}       Submitted
${tapproval_status}         Approved Project
${toverall_impact_score}     NA
#${ttotal_estimate_project_cost}      $1,532,151.00
#${ttotal_eligible_costs}     $1,269,520.00
${ttotal_funding_requested}      $1,532,151.00
${ttotal_funding_offered}        $0.00
#Project Details
${teditproj_name}       200 Innovation Dr - Land
${teditproj_desc}       Test Desc
${tproj_tier}       Standard / Normal Project
${tproj_status}     Approved Project

#Property Info
#parcels
${prop_info_title}      Property Information
${tparcel_id}       2410413300001
${tparcel_addr}
${tlast_assessment}     Invalid Date - $NaN
#proposed changes
${tproposed_sqft}       500000
${tproposed_use}        UseTypeIndustrial
${tproposed_estd_fav}       $1,269,520.00
#parking
${tmax_cap}     200
#construction activites
${tinterior}
${texterior}
${tstructural}
${tland}
#Property Info edit popup
${tedit_prop_info_parcel_id}        99-99-999-998
${tedit_prop_info_parcel_id1}        020224108018

#Developer info
#Applicant Info
${dev_info_title}       Applicant Information
${tapplicant_type}          Developer
${tapplicant_name}          John Developer
#Dev Prof
${tbuss_name}           TI Janesville X-SSB LLC
${tphone}               309-555-2233
${tdev_email}               tixssb@xssbllc.com
${tphy_addr}            200 Innovation Dr, Janesville WI 53546
${tmail_addr}           710 N Plankinton Ave, Milwaukee WI 53203
${tyears_in_buss}       NA
#Relationship
${tintention}           Unknown
#Dev Hist
${tdev_hist_dev_name}
${tdev_hist_company}
${tdev_hist_cont}
${tdev_hist_addr}

#Dev Info Edit Popup
${tdev_info_popup_app_option}           Tammy Tenant-tammy@cstenant.com
${tdev_info_popup_buss_option}          test bus
${tdev_info_popup_ind_option}           Rajesh Donepudi
${tdev_info_popup_role_option}          Residential Property Owner
${tdev_info_popup_relationship_option}          New Business Establishment


#Eligible costs
${eligible_costs_title}     Eligible Costs
${tacquistion_subtotal_value}           $1269520.00
${tdemolition_subtotal_value}           $0.00
${tsite_clearance_subtotal_value}       $0.00
${tsoft_costs_subtotal_value}           $0.00
${tother_subtotal_value}             $0.00
#Eligible costs edit inputs when there is no data in view

${tcat_input}       Test eligible costs categories name
${telg_cost_desc_input}     Test eligible costs categories desc

#Elg Costs Edit Popup

${tland_acq_elg_cost_input}     $2567
${tsite_prep_elg_cost_input}         $3434
${tdemolition_elg_cost_input}           $5433
${tclearingOrgrading_elg_cost_input}        4200
${tprop_assmb_elg_cost_input}       $4500
${tcost_of_rehab_elg_cost_input}        $3500
${telg_cost_to_new_const_input}     $2500
${tother_elg_cost_input}     2500
${treloc_cost_elg_cost_input}     $5500
${tcost_of_studies_input}     $4500
${tint_cost_input}     $3500

#Financing Details
#Fund Request
${financing_details_title}      Financing Details
${tfunding_request}         Not Specified
${teligible_costs_total}        $1269520.00
${ttotal_estimated_project_cost}        $1532151.00
${ttotal_funding_amt_req}           $1532151.00
${tupfront_funding_amt_req}         Not Specified
${tpay_go_funding_amt_req}          $1532151.00
#Funding Program Intiative Assignments
#Equity
#${tdev_equity}
#${tother_equity}
${tequity_subtotal}         $7000000.00
#Loans
#${tconstruction_financing}
#${tpermanent_financing}
${tloan_subtotal}           $4000000.00
#Other
${tother_subtotal}          $0.00

#Financing Details Edit Popup
${treq_fun_typ_input_option}
${test_elg_cost_totl_input}
${ttot_est_proj_cst_input}      1000
${treq_tot_fund_amt_input}      1000
${treq_upfrnt_fund_amt_input}       500
${treq_pay_go_fund_amt_input}       63000
${tfin_det_dev_equity_input}        5000
${tfin_det_const_loans_input}       5000
${tfin_det_add_notes}       fin det add notes

#Estimated timeline
${estimated_timeline_title}     Estimated Timeline
${estimated_timeline_title1}     Timeline
${testimated_timeline_alert_stmt}     Please indicate your project planning readiness
${tes_strt_dt}      July 2022
${tes_desc1}        Plan Preparation/Permit Approval
${tes_mid_dt}       July 2022
${tes_desc2}        Construction Start
${tes_end_dt}       January 2023
${tes_desc3}        Construction Complete

#Estimated Timeline Edit Popup
${tphase1_input}        Construction Completion Test
${tdate1_input}     1/20/2022
${tdescription1_input}      Construction is set to end Jan. 30, 2023
${tupdated_datetime1_input}     2/22/2023
${tcompletion_status1_option}      Started

#Projections
${projections_title}        Projections
#Estimated Jobs Numbers
${test_tot_no_of_fte_jobs}
${test_no_of_jobs_ctd}
${test_no_of_jobs_rtd}
#Actual Jobs Numbers
${tact_tot_no_of_fte_jobs}
${tact_no_of_jobs_ctd}
${tact_no_of_jobs_rtd}
#Avg Sal of Jobs
${tavg_pay_of_mgmt}
${tavg_pay_of_sal_emp}
${tavg_pay_of_hrly_emp}
${tjob_title}
#No of Trees Planted
${ttyp_of_tree}
${tno_of_tree}


#Parties
${parties_title}        Party Information
${parties_title1}        Parties
${tprop_own_buss_name}          JS Developers LLC
${tprop_own_buss_ein}           NA
${tprop_own_cont_name}          John Smith
${tprop_own_addr}           123 Main St Joliet IL 60432
${tprop_own_phn_no}         815-555-1234

#Parties Edit Popup
${tparty_edit_prop_own_buss_name_input}     Prop Own
${tparty_edit_prop_own_buss_ein_input}      12345-09
${tparty_edit_prop_own_first_name_input}        Rob
${tparty_edit_prop_own_last_name_input}     Green
${tparty_edit_prop_own_phn_no_input}        88888800900
${tparty_edit_prop_own_email_input}         solo813@live.com
${tparty_edit_prop_own_addr1_input}         820 Main
${tparty_edit_prop_own_addr2_input}         St
${tparty_edit_prop_own_city_input}          city
${tparty_edit_prop_own_state_input}         state
${tparty_edit_prop_own_zip_input}           61555

#Documentation Collection
${doc_coll_title}       Documentation Collection

#Declarations
${declarations_title}       Declarations
${tapp_ans_val}         Applicant Answer: No


#Declarations Edit Popup
${tdeclarations_alert_msg_stmt}       If you have any questions
${tdeclarations_option}     Other
${tdeclarations_written_stmt}       test

#Agreement
#Agreement Obligations
${tagreement_title}     Jobs Report
${tagreement_responsible_party}     Applicant
${tagreement_compliance_status}     Pending Compliance
${tagreement_claw_back_provision}           Yes
${tagreement_obl}       Building Cost
${tagreement_frequency}          Annually
${tagreement_frequency_value}          1
#Agreement Documents
${tagreement_filename}       Approved Moes Brewpub TIF agreement 120621.pdf
${tagreement_type}       ADOPTED
${tagreement_uploaded_dtm}       10/19/2022

#Add Agreement Obligation
${tadd_agreement_title}     Test Title
${tadd_agreement_desc}      Test Desc
${tadd_agreement_oblig_strt_dt}     1/1/2023
${tadd_agreement_oblig_end_dt}      12/31/2023
${tadd_agreement_oblig_email_addr}      test@gmail.com
${tadd_agreement_end_dt}     1/1/2025

#Edit Agreement Obligation
${tedit_agreement_title}      Test Edit Title
${tedit_agreement_desc}      Test Edit Desc
${tedit_agreement_oblig_strt_dt}     1/1/2024
${tedit_agreement_oblig_end_dt}      12/31/2024
${tedit_agreement_oblig_email_addr}      testedit@gmail.com
${tedit_agreement_end_dt}     1/1/2026
${tedit_agreement_obl_status}       In Compliance

#Edit Agreement Document
${tagreement_doc_name}      ProjDetails.pdf
${agrmt_fileloc}      ${CURDIR}\\${tagreement_doc_name}
${tagreement_doc_name1}     annual-enterprise-survey-2021-financial-year-provisional-size-bands-csv.csv
${agrmt_fileloc1}      ${CURDIR}\\${tagreement_doc_name1}
${tagrmt_type}       Adopted
${tagrmtcomp_type}       ADOPTED
${tagrmt_type1}       DRAFT

#Files
#applicant
${tapplicant_files_filename}        Moes_Floorplan.pdf
${tapplicant_files_uploaded_dtm}        10/19/2022
${tapplicant_files_status}      Pending
#${tapplicant_files_comments}
#staff
${tstaff_files_filename}        Score Project - Moes Brewpub.pdf
${tstaff_files_uploaded_dtm}        10/19/2022
${tstaff_files_status}      Pending
#${tstaff_files_comments}

#Upload file
${tupload_file_type_applicant}      Applicant
${tupload_file_type1_staff}     Staff
${tupload_file_type2_thirdparty}     Third
${tfile_tab_filename}       Moes
${tfile_tab_filename1}       Project
${tfile_tab_filename2}       Moes
${trejectreason}        test rejection
${tfile_appl_doc_name}       annual-enterprise-survey-2021-financial-year-provisional-size-bands-csv.csv
${tfile_status}     Approved
${file_tab_appl_fileloc}      ${CURDIR}\\${tfile_appl_doc_name}
${tfile_doc_name}       ProjDetails.pdf
${file_tab_fileloc}      ${CURDIR}\\${tfile_doc_name}
${tfile_doc_name1}       ProgresscityImg.jpg
${file_tab_fileloc1}      ${CURDIR}\\${tfile_doc_name1}
#Compliance
${tcompliance_agreement_mandate_title1}     Test
${tcompliance_agreement_desc1}      Desc
${tcompliance_agreement_resp_party1}        Applicant
${tcompliance_status1}      Pending Compliance
${tpastdue_agreement_title1}        string
${tpastdue_requested1}      24/01/2023
${tpastdue_status1}     string
${tpastdue_duedate1}        24/01/2023
${tupcoming_agreement_title1}       string
${tupcoming_requested1}     24/01/2023
${tupcoming_status1}       string
${tupcoming_duedate1}       24/01/2023

#Audit
${taudit_dtm1}      11/4/2022
${taudit_desc1}     Project commmission status updated to Approved Project
${taudit_by1}       Nick Tully

#Correspondence
#Notes
${tcorrespondence_notes_datetime}           04/11/2022, 12:57:43
${tcorrespondence_notes_note}           Approved for $125,000
${tcorrespondence_notes_projappr_status}            Opened
${tcorrespondence_notes_vis_to_app}         Yes
${tcorrespondence_notes_by}         Nick Tully
#Sent Messages
${tcorrespondence_sentmessages_subject}         New Business in Growth City
${tcorrespondence_sentmessages_datetime}        2022-10-03T08:49:22.773
${tcorrespondence_sentmessages_recp_email}      sblack@civicserve.com

${fileloc}      ${CURDIR}\\${tagreement_doc_name}
${tagreement_doc_name2}     ProgresscityImg.jpg
${fileloc1}      ${CURDIR}\\${tagreement_doc_name2}

${trec_email}       test.civicserve@gmail.com
${tsubject}     Test Subject from Correspondence
${tcorr_body}       Test Body from correspondence
#Delete Proj
${tdelproj_name}       sample test

#----------------------------------------------------

#-------------------Contacts--------------------------
#People
${tfirst_name}             Test First
${tedit_first_name}             Test First Edit
${tlast_name}      Last
${ttags}       Test
${tcon_email}      test.civicserve@gmail.com
${tcon_addr}        addr1
${tcon_phnno}       34324223233
${tcon_sub}     test subject
${tcon_heading}      test heading
${tcon_body}     test body
${tcon_temp_name}     Attract and Retain- New Program Alert
#Gmail
${tgmail}       test.civicserve@gmail.com
${tpswd}        lyexnaghudljomuv
#ezqdgfszltoibkld
${expected_sub}     New Program available in Progress City
${expected_body}        Progress City has recently launched a new loan program in your area!
${tgmail1}       test.civicserve1@gmail.com
${tpswd1}        ryeoqbtiubvhkaid

${expected_sub1}     New Program available in Progress City
${expected_body1}        Progress City has recently launched a new loan program in your area!

${tgmail2}       test.civicserve2@gmail.com
${tpswd2}        nfqjjxtviuabshrg


#Templates
${ttemp_name}             Test Name
${tedit_temp_name}             Test Edit Name
${ttemp_sub}              Test Subject
${ttemp_heading}          Test Heading
${ttemp_body}               Test Body

#Businesses
#Create/Edit
${tnewbuss_name}       Test Business Create
${teditbuss_name}       Business Test Edit
${tbuss_email}      test@gmail.com
${tbuss_phn}        232324234511
${tbuss_fax}        324545324511
${tbuss_form_dt}        2/22/2023
${tbuss_website}        test
${tbuss_addr_line1}     addr1
${tbuss_addr_line2}     addr2
${tbuss_city}       city
${tbuss_state}      state
${tbuss_zip}        45353
${tbuss_type}        Auto Service
${tbuss_dt_of_fmtn}     2/22/2023
${tvieworedit_buss_name}       Test Create Business
#Del
${tdel_buss_name}       Test Create Business

#------------------Notifications----------------------
${tadmin_usersto_notify_option}     test civicserve
${tprogram_types_option}        TIF
${tprograms_option}     Test
#TIF
${tnotification_event_type_option}      User Management - Invite User
#Application - Submitted
${temail_template_option}       User Invite
#Application - Submitted
${temail_template_sub}       Invited to CivicServe
#Application - Submitted
${temail_template_body}       You are invited to join civicserve
#Thank you for submitting an application

${tadmin_usersto_notify_option1}     Test GOV Admin
${tprogram_types_option1}        TIF
${tprograms_option1}     Test
${tnot_sub_input}       Test Application Status Change
${tnot_body_input}      Test Application Status Change Body
#TIF
${tnotification_event_type_option1}      Application - Status Change

#----------------------------------------------------

#-------------------Applicant Portal---------------------------------

#Program name
${tappl_prog_name1}         Test
${tappl_prog_name}         Tax Increment Financing (TIF) Program
#Test TIF
${tappl_prog_name1}         TIF
${tappl_prog_name2}         TIF
#Project name
${tappl_proj_name}      Addr1
${tappl_proj_desc}      Test Project Desc
${tappl_proj_tier}      Standard / Normal Project
${tappl_proj_status}        Pending Approval
${tfirst_Step1}      Applicant Information
${tfirst_Step}      Property Information
#Project Details
${tprop_sq_foot}        34252
${test_fut_prop_value}      4222
${tzone_change_option}     No
${tproposed_property_use_option}        Office
${texterior_ada_access_checkbx}     Exterior - ADA Accessibility:
${tappl_proj_name1}      122 N MAIN ST
${tappl_proj_name2}      obligation

${tproj_type}       Major Catalyst Project
#Property Info
${tappl_parcel_id}      020223207016
${tadmin_proj_name}      122 N MAIN ST
${tappl_parcel_id1}      123456789
${tproj_name}       207 W Jefferson St
#${tproj_name_comp}      207 W Jefferson St
#020223207014
# - 123 MAIN ST
#020223207016 - 122 N MAIN ST

#Dev Info
${tdev_name}     Tammy
${tdev_info_buss_icon_text}     Business or Company
${tdev_info_buss_option}          new business
${tdev_info_role_option}          Residential Property Owner
${tdev_info_relationship_option}          New Business Establishment

#Eligible Costs

${tappl_land_acq_elg_cost_input}     2567
${tappl_site_prep_elg_cost_input}         3434
${tappl_demolition_elg_cost_input}           5433
${tappl_clearingOrgrading_elg_cost_input}        4200
${tappl_prop_assmb_elg_cost_input}       4500
${tappl_cost_of_rehab_elg_cost_input}        3500
${tappl_elg_cost_to_new_const_input}     2500
${tappl_other_elg_cost_input}     2500
${tappl_reloc_cost_elg_cost_input}     5500
${tappl_cost_of_studies_input}     4500
${tappl_int_cost_input}     3500


#Finaincing Details
${tappl_tot_est_proj_cst_input}     1000
${tappl_req_tot_fund_amt_input}     1000

#Parties

${tparty_header_text}       parties
${tparty_prop_own_buss_name_input}     Prop Own
${tparty_prop_own_buss_ein_input}      12345-09
${tparty_prop_own_first_name_input}        Rob
${tparty_prop_own_last_name_input}     Green
${tparty_prop_own_phn_no_input}        88888800901
${tparty_prop_own_email_input}         solo813@live.com
${tparty_prop_own_addr1_input}         820 Main
${tparty_prop_own_addr2_input}         St
${tparty_prop_own_city_input}          city
${tparty_prop_own_state_input}         state
${tparty_prop_own_zip_input}           61555

#Estimated Timeline
${tappl_phase1_input}       Construction Completion Test
${tappl_date1_input}     1/20/2022
${tappl_description1_input}      Construction is set to end Jan. 30, 2023
${tappl_updated_datetime1_input}     2/22/2023
${tappl_responsible_party_input}     Developer
${tappl_responsible_party_value}     1
${tappl_completion_status1_option}      Started

#Projections
${tproj_jobs_created_textbox}       500
${tproj_jobs_retained_textbox}       400
${tproj_trees_planted_textbox}       200
${tproj_jobs_created_text}       Not Answered

#Document Collection
${tappl_doc_coll_header_text}       Documentation Collection

#Declarations
${tappl_decl_header_text}       Declarations
${tappl_declarations_applicant_ans}        Yes
${tappl_declarations_option}        Other
${tappl_declarations_written_stmt}      test

${tloggedin_applicant_name}     Shilpa

#Applicant Businesses
#Create/Edit
${tappl_newbuss_name}       Test Applicant Business
${teditappl_buss_name}       Test Edit Business
${tappl_buss_email}      test@gmail.com
${tappl_buss_phn}        23232423451
${tappl_buss_fax}        32454532451
${tappl_buss_form_dt}        2/22/2023
${tappl_buss_website}        test
${tappl_buss_addr_line1}     addr1
${tappl_buss_addr_line2}     addr2
${tappl_buss_city}       city
${tappl_buss_state}      state
${tappl_buss_zip}        45353
${tappl_buss_type}        Auto Service
${tappl_buss_dt_of_fmtn}     2/22/2023
${tappl_vieworedit_buss_name}       Test Create Business
#Del
${tdel_applbuss_name}       Test Create Business

#------------User Management------------
${tuserfirstname_input}       test
${tuserlastname_input}       civicserve
${temail_input}       test.civicserve@gmail.com
${tphone_no_input}       45454334251
${taddress_line1}        addr1
${taddress_line2}        addr2
${taddr_city}        city
${taddr_state}       state
${taddr_postal_code}        53433
${tnewpswd_input}     CivicServe#1
${tnewpswd_input1}     CivicServe#3
${user_reset_expected_sub}     Reset Password
${user_reset_expected_body}        To reset your password, click the button below
${tuserfirstname_input1}    test
${tuserlastname_input1}    civicserve1
${temail_input1}     test.civicserve1@gmail.com
${tphone_no_input1}       55454334251
${user_invitation_expected_sub}     Invitation to Join
${user_invitation_expected_body}        You have been invited to join
${tedit_userfirstname_input}       testing
${tedit_userlastname_input}       civicserve
${tedit_email_input}       test.civicserve@gmail.com
${tedit_phone_no_input}       35454334251
${tedit_address_line1}        addr1
${tedit_address_line2}        addr2
${tedit_addr_city}        city
${tedit_addr_state}       state
${tedit_addr_postal_code}        53433
${tedit_userfirstname_input1}    testing
${tedit_userlastname_input1}    civicserve1
${tedit_email_input1}     test.civicserve1@gmail.com
${tedit_phone_no_input1}       65454334251
${user_reset_pswd_sub}     Reset Password
${user_reset_pswd_body}        To reset your password, click the button below
${treset_newpswd_input}     CivicServe#2

#---------------Parcels--------------------
${tparcel_id_input}        020223207026
${teditparcel_id_input}        020223207226
${tparcel_addr1_input}        Addr1
${tparcel_city_input}        City
${tparcel_county_input}        County
${tparcel_state_input}        State
${tparcel_zip_input}        54343
${tparcel_lat_input}        41
${tparcel_long_input}        -80
${tparcel_baseyr_input}        2000
${tparcel_base_assemt_input}        3000
${tparcel_sqfoot_input}        10000
${tparcel_usetype_option}        Office
${tdis_name}        City Wide District
${tsearch_selected_programs_input}      Tax Increment Financing (TIF) Program

#--------------- Global Agreement Obligations-------------
${tglob_agreement_title}     Test create glob agreement
${tglob_agreement_desc}      Test Desc
${tglob_agreement_responsible_party}     Applicant
${tglob_agreement_obl_typ}      Building Cost
${tglob_agreement_claw_back_provision}           Yes
${tglob_agreement_frequency}          Annually
${tglob_agreement_frequency_value}          1
${tglob_prog}       QA Fields Test
#Tax Increment Financing (TIF) Program

#---edit---
${tglob_edit_agreement_title}     Test edit glob agreement
${tglob_edit_prog}       Enterprise Zone (EZ) Program

#-------------kpi----------
#----add-----
${tkpi_name}        test create kpi
${tkpi_desc}        test kpi desc
${tkpi_type_option}     Number
${tkpi_prog}        QA Fields Test

#----edit----
${tedit_kpi_name}       Test edit kpi
${tkpi_edit_prog}       Tax Increment Financing (TIF) Program


*** Keywords ***

#TestData: Generate random value
#    ${result} =    Generate Random String    8
#    RETURN        ${result}

TestData: Convert string to dollars
    [Documentation]    convert string to dollars
    [Arguments]     ${value}

    ${number3}= 		Set Variable	${value}
    ${currstring} = 	Evaluate		"{:,.0f}".format(${number3})
    ${number2} = 		Catenate    $${currstring}.00
    RETURN      ${number2}

TestData: Create Project Name
    [Documentation]    create a project name
    [Arguments]     ${tproj_name}

    ${currdate}=    Get Current Date    result_format=%m/%d/%Y
#    ${space}=       '   '
    ${tproj_name}= 		Catenate    ${tproj_name}${SPACE*2}-${SPACE}${currdate}
    Set Global Variable    ${tproj_name_comp}       ${tproj_name}
    Log    ${tproj_name_comp}


