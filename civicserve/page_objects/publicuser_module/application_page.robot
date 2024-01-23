*** Settings ***
Documentation    This file contians page objects for public user home page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot

*** Variables ***

${application_skip_btn}     xpath=//a[contains(text(),'Skip')][contains(@href,'start-application')]
#//a[contains(@href,'start-application')]
${application_sub_heading}     xpath=//div[@class='application-sub-heading'][contains(text(),'${tappl_prog_name1}')]
${appl_proj_name}     xpath=//span[contains(text(),'Project Name:')]//ancestor::label//following-sibling::div//input[@name='name']
${appl_proj_desc}     xpath=//span[contains(text(),'Project Description:')]//ancestor::label//following-sibling::div//textarea[@name='description']
${start_appl_btn}       xpath=//button[contains(text(),'Start New Application')]
#${application_status}       xpath=//b[contains(text(),'${appl_proj_name}')]//ancestor::tr//div[@class='badge badge-danger badge-outline-danger']
${parcel_ele}       xpath=//div[@class='panel']
#${appl_selected_buss_ele}        xpath=//input[@name='SelectedBusinessId']
${appl_selected_parcelid}        xpath=//span[contains(text(),'${tappl_parcel_id1}')]
${appl_selected_parcelid1}        xpath=//span[contains(text(),'${tedit_prop_info_parcel_id1}')]
${next_btn}     xpath=//button[contains(text(),'Next')]
${back_btn}     xpath=//button[contains(text(),'Back')]
${saved_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${no_loader_icon}      xpath=//div[@id='loader'][@style='display: none;']
${step1_success_border}      xpath=//div[@class='step-border-sucess'][@style='width: 100%;']
${step2_empty_border}      xpath=//div[@class='step-border-sucess'][@style='width: 0%;']//parent::div//following-sibling::div[@class='step-name'][contains(text(),'Step 2')]
${first_step_tick_mark}      xpath=//a[@class='stepper-node step-completed'][contains(text(),'${tfirst_Step}')]
${first_step_without_tick_mark}      xpath=//a[@class='stepper-node step-current'][contains(text(),'${tfirst_Step}')]
${policy_name_text}      xpath=//h3[contains(text(),'Policies')]//parent::div//div[@class='stepper-labels']//a[contains(text(),'${tpolicy_name1}')]
${application_step_name_text}      xpath=//h3[contains(text(),'Application Steps')]//parent::div//div[@class='stepper-labels']//a[contains(text(),'${tapplication_step_name12}')]

#---Project Details----
${prop_sq_foot}     xpath=//span[contains(text(),'Proposed Square Footage Post Project Completion:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${proj_det_header}     xpath=//strong[contains(text(),'${tadmin_proj_name}')]
${est_fut_prop_value}     xpath=//span[contains(text(),'Estimated Future Property Value:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${zone_change_dd}     xpath=//span[contains(text(),'Will a Zoning Change Be Required?:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${zone_change_option}     xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tzone_change_option}')]
${proposed_property_use_dd}     xpath=//span[contains(text(),'Select Target Proposed Property Use:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${proposed_property_use_option}     xpath=//div[contains(text(),'${tproposed_property_use_option}')]
${exterior_ada_access_checkbx}     xpath=//span[contains(text(),'${texterior_ada_access_checkbx}')]//ancestor::label//following-sibling::div//div[@class='dx-checkbox-container']
${step1_element}     xpath=//div[@style='width: 100%;'][@class='step-border-sucess']//parent::div//following-sibling::div[@class='step-name'][contains(text(),'Step 1')]
#----Property info-----
${parcel_alert_text_ele}     xpath=//div[@class='alert alert-info'][contains(text(),'Please select the Parcels or Addresses associated with this Project')]
${parcel_loading_ele}     xpath=//div[contains(text(),'Loading')]
${div_ele}     xpath=//div[@class='w-100']
${parcel_id_dd}     xpath=//div[@class='dx-texteditor-input-container dx-tag-container']//input[@autocomplete='off'][@role='combobox']
${parcel_id_option}     xpath=//div[contains(text(),'${tappl_parcel_id1}')]

#----Developer Info----

${dev_info_buss_icon_text}        xpath=//div[@class='dx-item-content']
${appl_selected_buss_ele}        xpath=//input[@name='selectedBusinessId']
${dev_info_buss_radio}        xpath=//div[@role='radio']//div[@class='dx-item-content'][contains(text(),'Business')]
${dev_info_ind_radio}        xpath=//div[@role='radio']//div[@class='dx-item-content'][contains(text(),'Individual')]
${dev_info_buss_dd}           xpath=//span[contains(text(),'Select business already in the system:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_buss_option}       xpath=//div[@role='option']//div[contains(text(),'${tdev_info_buss_option}')]
${dev_info_role_dd}        xpath=//span[contains(text(),'Please select your role in this proposed project:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
#//input[@name='ApplicantRoleInProject']//parent::div//following-sibling::div[@class='dx-texteditor-container']//input[@autocomplete='off']

${dev_info_role_option}        xpath=//div[@role='option']//div[contains(text(),'${tdev_info_role_option}')]
${dev_info_realtionship_dd}        xpath=//span[contains(text(),'Proposed Relationship:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_relationship_option}        xpath=//div[@role='option']//div[contains(text(),'${tdev_info_relationship_option}')]

#-----Eligible Costs-----
${appl_clearingOrgrading_ele_text}           xpath=//input[@value='${tappl_clearingOrgrading_elg_cost_input}']
${appl_land_acq_elg_cost_input}           xpath=//span[contains(text(),'Acquisition')]//following-sibling::div//span[contains(text(),'Land Acquisition')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_prop_assmb_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Property Assembly Costs')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_site_prep_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Site Preparations')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_demolition_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Demolition')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_clearingOrgrading_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Clearing / Grading')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_cost_of_rehab_elg_cost_input}     xpath=//span[contains(text(),'Building Costs')]//following-sibling::div//span[contains(text(),'Cost of rehabilitation or remodeling of existing buildings')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_elg_cost_to_new_const_input}      xpath=//span[contains(text(),'Building Costs')]//following-sibling::div//span[contains(text(),'Eligible costs relating to new construction')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_other_elg_cost_input}     xpath=//span[contains(text(),'Other')]//following-sibling::div//span[contains(text(),'Other')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_reloc_cost_elg_cost_input}        xpath=//span[contains(text(),'Soft Costs')]//following-sibling::div//span[contains(text(),'Relocation costs')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_cost_of_studies_input}        xpath=//span[contains(text(),'Soft Costs')]//following-sibling::div//span[contains(text(),'Cost of studies')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_int_cost_input}       xpath=//span[contains(text(),'Soft Costs')]//following-sibling::div//span[contains(text(),'Interest cost')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

#------Financing Details--------
${appl_req_fun_typ_input}     xpath=//span[contains(text(),'Requested Funding Type')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_est_elg_cost_totl_input}        xpath=//span[contains(text(),'Estimated Eligible Costs Total:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_tot_est_proj_cst_input}        xpath=//span[contains(text(),'Total Estimated Project Cost:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_req_tot_fund_amt_input}     xpath=//span[contains(text(),'Requested Total Funding Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_req_upfrnt_fund_amt_input}      xpath=//span[contains(text(),'Requested Up Front Funding Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_req_pay_go_fund_amt_input}      xpath=//span[contains(text(),'Requested Pay Go Funding Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_fin_det_dev_equity_input}       xpath=//span[contains(text(),'Equity')]//following-sibling::div//span[contains(text(),'Developer Equity')]//following-sibling::div//span[contains(text(),'Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_fin_det_const_loans_input}      xpath=//span[contains(text(),'Loans')]//following-sibling::div//span[contains(text(),'Construction Loans')]//following-sibling::div//span[contains(text(),'Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_fin_det_add_notes}        xpath=//span[contains(text(),'Additional Notes / Comments:')]//ancestor::label//following-sibling::div//textarea

#-------------Parties-------------
${party_prop_own_buss_name_input}        xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Business Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_buss_ein_input}         xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'EIN:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_first_name_input}        xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'First Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_last_name_input}        xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Last Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_phn_no_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Phone Number:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_email_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Email:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_addr1_input}             xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Address 1:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_addr2_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Address 2:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_city_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'City:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_state_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'State:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_prop_own_zip_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Zip:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

#----------------EStimated Timeline--------
${appl_timeline_text}        xpath=//option[@value='true'][contains(text(),'We have a target timeline')]
${appl_timeline_res_party_text}        xpath=//input[@name='partyType'][@value='${tappl_responsible_party_value}']
${appl_timeline_selection_dd}        xpath=//select[@id='timeline-selection']
${appl_timeline_selection_option}        xpath=//option[contains(text(),'We have a target timeline')]
${appl_timeline_add_phase_btn}        xpath=//button[contains(text(),'Add Additional Phase')]
#1
${appl_phasename1_input}       xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_date1_input}      xpath=//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_description1_input}       xpath=//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party1_dd}       xpath=//select//following-sibling::div[1]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party1_option1}       xpath=//div[contains(text(),'${tappl_responsible_party_input}')]
${appl_completion_status1_dd}        xpath=//select//following-sibling::div[1]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_completion_status1_option1}        xpath=//div[contains(text(),'${tcompletion_status1_option}')]
${appl_updated_datetime1_input}        xpath=//select//following-sibling::div[1]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
#2
${appl_phase2_input}       xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Phase:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_date2_input}      xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_description2_input}       xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party2_dd}       xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party2_option1}       xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_responsible_party_input}')]
${appl_completion_status2_dd}        xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_completion_status2_option1}        xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_completion_status1_option}')]
${appl_updated_datetime2_input}        xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date/Time:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
#3
${appl_phase3_input}       xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Phase:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_date3_input}      xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_description3_input}       xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party3_dd}       xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party3_option1}       xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_responsible_party_input}')]
${appl_completion_status3_dd}        xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_completion_status3_option1}        xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_completion_status1_option}')]
${appl_updated_datetime3_input}        xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date/Time:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

${appl_add_additional_phase_btn}     xpath=//button[contains(text(),'Add Additional Phase')]
#4
${appl_phase4_input}       xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Phase:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_date4_input}      xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_description4_input}       xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party4_dd}       xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_responsible_party4_option1}       xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_responsible_party_input}')]
${appl_completion_status4_dd}        xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_completion_status4_option1}        xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_completion_status1_option}')]
${appl_updated_datetime4_input}        xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date/Time:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

#--------------Projections-------------------------
${appl_proj_text}           xpath=//input[@value='${tproj_jobs_created_textbox}']
${appl_add_another_btn_ele}      xpath=//button[contains(text(),'Add Another')]
${appl_proj_jobs_created_add_another_btn}      xpath=//h3[contains(text(),'Jobs Created')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//button[contains(text(),'Add Another')]
${appl_proj_jobs_created_textbox}      xpath=//span[contains(text(),'Jobs Created')]//ancestor::label//following-sibling::div//input[@type='text']
${appl_proj_jobs_retained_add_another_btn}      xpath=//h3[contains(text(),'Jobs Retained')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//button[contains(text(),'Add Another')]
${appl_proj_jobs_retained_textbox}      xpath=//span[contains(text(),'Jobs Retained')]//ancestor::label//following-sibling::div//input[@type='text']
${appl_proj_trees_planted_add_another_btn}      xpath=//h3[contains(text(),'Trees Planted')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//button[contains(text(),'Add Another')]
${appl_proj_trees_planted_textbox}      xpath=//span[contains(text(),'Trees Planted')]//ancestor::label//following-sibling::div//input[@type='text']

#--------------Documentation Collection-------------
${appl_doc_coll_upload_btn}       xpath=//div[@class='file-uploader-trigger']
${appl_doc_coll_fileloc}      AutomationTesting\\civicserve\\test_data\\annual-enterprise-survey-2021-financial-year-provisional-size-bands-csv.csv
${appl_filename}        annual-enterprise-survey-2021-financial-year-provisional-size-bands-csv.csv
${appl_doc_coll_upload_icon}     xpath=//i[@class='dx-icon dx-icon-upload']
${appl_uploaded_btn_text}       xpath=//div[contains(text(),'Click or drag and drop files here')]
${appl_upload_agrmt_doc}       xpath=//div[@class='dx-fileuploader-input-container']//input[@type='file']
#----------------Declarations--------------------
${appl_declarations_radio}           xpath=//div[@class='dx-item-content'][contains(text(),'${tappl_declarations_applicant_ans}')]//preceding-sibling::div//div[@class='dx-radiobutton-icon']
${selected_appl_declarations_yes_radio}           xpath=//div[contains(text(),'Yes')]//preceding-sibling::div//div[@class='dx-radiobutton-icon dx-radiobutton-icon-checked']
${appl_declarations_dd}           xpath=//span[contains(text(),'Relationship')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${appl_declarations_option}           xpath=//div[contains(text(),'${tappl_declarations_option}')]
${appl_declarations_written_stmt}        xpath=//span[contains(text(),'Please provide a written statement')]//ancestor::label//following-sibling::div//textarea

#--------------Summary------------------------
#-----Applicant Info-------------------

${appl_applicnt_info_header_ele}       xpath=//h3[@class='panel-heading'][contains(text(),'Applicant / Primary Contact Information')]
${appl_applicnt_type_ele}       xpath=//div[@class='title'][contains(text(),'Applicant Type')]//following-sibling::div[@class='value'][contains(text(),'${tdev_info_role_option}')]
${appl_applicnt_name_ele}       xpath=//div[@class='title'][contains(text(),'Name')]//following-sibling::div[@class='value'][contains(text(),'${tproj_ind}')]
${appl_applicnt_intention_ele}       xpath=//div[@class='title'][contains(text(),'Intention')]//following-sibling::div[@class='value'][contains(text(),'${tdev_info_relationship_option}')]
${appl_applicnt_buss_name_ele}       xpath=//h3[contains(text(),'Business Profile')]//ancestor::div[@class='panel']//div[@class='panel-body']//div[@class='title'][contains(text(),'Business Name')]//following-sibling::div[@class='value']//span[contains(text(),'${tdev_info_buss_option}')]
#//div[@class='title'][contains(text(),'Business Name')]//following-sibling::div[@class='value'][contains(text(),'${tdev_info_buss_option}')]

#---------Property Info--------------------

${appl_property_info_header_ele}       xpath=//h3[contains(text(),'Parcels')]
${appl_prop_info_parcel_id_ele}       xpath=//div[@class='title'][contains(text(),'Parcel ID')]//following-sibling::div[@class='value'][contains(text(),'${tappl_parcel_id1}')]

#----------Proposed Project Info-----------

${appl_proposed_proj_header_ele}       xpath=//h3[contains(text(),'Project Details')]
${appl_proposed_sqfoot_ele}       xpath=//div[@class='title'][contains(text(),'Proposed Square footage')]//following-sibling::div[@class='value'][contains(text(),'${tprop_sq_foot}')]
${appl_fut_prop_value_ele}       xpath=//div[@class='title'][contains(text(),'Estimated Future Assessed Value')]//following-sibling::div[@class='value'][contains(text(),'${test_fut_prop_value}')]
${appl_prop_use_ele}       xpath=//div[@class='title'][contains(text(),'Proposed Use')]//following-sibling::div[@class='value']//div[contains(text(),'${tproposed_property_use_option}')]

#---------Eligible Costs------------------

${appl_acquistion_proj_header_ele}       xpath=//h3[@class='panel-heading'][contains(text(),'Acquisition')]
${appl_land_acq_ele}       xpath=//td//div[contains(text(),'Land Acquisition')]//parent::td//following-sibling::td[contains(text(),'${tappl_land_acq_elg_cost_input}')]
${appl_site_prep_ele}       xpath=//td//div[contains(text(),'Site Preparations')]//parent::td//following-sibling::td[contains(text(),'${tappl_site_prep_elg_cost_input}')]
${appl_demolition_ele}       xpath=//td//div[contains(text(),'Demolition')]//parent::td//following-sibling::td[contains(text(),'${tappl_demolition_elg_cost_input}')]
${appl_clearingOrgrading_ele}       xpath=//td//div[contains(text(),'Clearing / Grading')]//parent::td//following-sibling::td[contains(text(),'${tappl_clearingOrgrading_elg_cost_input}')]
${appl_building_costs_header_ele}       xpath=//h3[@class='panel-heading'][contains(text(),'Building Costs')]
${appl_prop_assmb_ele}       xpath=//td//div[contains(text(),'Property Assembly Costs')]//parent::td//following-sibling::td[contains(text(),'${tappl_prop_assmb_elg_cost_input}')]
${appl_cost_of_rehab_ele}       xpath=//td//div[contains(text(),'Cost of rehabilitation')]//parent::td//following-sibling::td[contains(text(),'${tappl_cost_of_rehab_elg_cost_input}')]
${appl_elg_cost_to_new_const_ele}       xpath=//td//div[contains(text(),'Eligible costs relating to new construction')]//parent::td//following-sibling::td[contains(text(),'${tappl_elg_cost_to_new_const_input}')]
${appl_other_elg_cost_ele}       xpath=//td//div[contains(text(),'Other')]//parent::td//following-sibling::td[contains(text(),'${tappl_other_elg_cost_input}')]
${appl_soft_costs_header_ele}       xpath=//h3[@class='panel-heading'][contains(text(),'Soft Costs')]
${appl_reloc_cost_ele}       xpath=//td//div[contains(text(),'Relocation costs')]//parent::td//following-sibling::td[contains(text(),'${tappl_reloc_cost_elg_cost_input}')]
${appl_cost_of_studies_ele}       xpath=//td//div[contains(text(),'Cost of studies')]//parent::td//following-sibling::td[contains(text(),'${tappl_cost_of_studies_input}')]
${appl_int_cost_ele}       xpath=//td//div[contains(text(),'Interest cost')]//parent::td//following-sibling::td[contains(text(),'${tappl_int_cost_input}')]


#----------Financing Details--------------
${appl_fin_det_header_ele}       xpath=//h3[@class='panel-heading'][contains(text(),'Fund Request')]
${appl_est_prjct_cst_ele}       xpath=//td[contains(text(),'Total Estimated Project Cost')]//following-sibling::td[contains(text(),'${tappl_tot_est_proj_cst_input}')]
${appl_fund_req_amt_ele}       xpath=//td[contains(text(),'Total Funding Amount Requested')]//following-sibling::td[contains(text(),'${tappl_req_tot_fund_amt_input}')]

#---------Estimated Timeline--------------
${appl_est_timeline_header_ele}       xpath=//strong[contains(text(),'${tappl_phase1_input}')]
${appl_est_timeline_phase_name_ele}       xpath=//strong[contains(text(),'${tappl_phase1_input}')]
${appl_est_timeline_desc_ele}       xpath=//div[contains(text(),'${tappl_description1_input}')]
${appl_est_timeline_res_party_ele}       xpath=//div[contains(.,'Responsible Party') and contains(.,':') and contains(.,'${tappl_responsible_party_input}')]

#---------Projections-----------------
${appl_projections_header_ele}      xpath=//h3[contains(text(),'Projections')]
${appl_projections_jobs_created}      xpath=//div[@class='title'][contains(text(),'Jobs Created')]//following-sibling::div[@class='value'][contains(text(),'${tproj_jobs_created_textbox}')]
${appl_projections_jobs_retained}      xpath=//div[@class='title'][contains(text(),'Jobs Retained')]//following-sibling::div[@class='value'][contains(text(),'${tproj_jobs_retained_textbox}')]
${appl_projections_trees_planted}      xpath=//div[@class='title'][contains(text(),'Trees Planted')]//following-sibling::div[@class='value'][contains(text(),'${tproj_trees_planted_textbox}')]



#---------Parties--------------
${appl_party_header_ele}       xpath=//h3[contains(text(),'${parties_title}')]
${appl_party_prop_own_header_ele}       xpath=//h3[contains(text(),'Parties')]//ancestor::div[@class='page-header']//following-sibling::div//h3[@class='panel-heading'][contains(text(),'Property Owner')]
${appl_party_name}       xpath=//div[@class='title'][contains(text(),'Contact Name')]//following-sibling::div[@class='value'][contains(.,'${tparty_prop_own_first_name_input}') and contains(.,'${tparty_prop_own_last_name_input}')]
${appl_party_business_name}       xpath=//div[@class='title'][contains(text(),'Business Name')]//following-sibling::div[@class='value'][contains(.,'${tparty_prop_own_buss_name_input}')]
${appl_party_business_ein}       xpath=//div[@class='title'][contains(text(),'Business EIN')]//following-sibling::div[@class='value'][contains(.,'${tparty_prop_own_buss_ein_input}')]
${appl_party_phone}       xpath=//div[@class='title'][contains(text(),'Phone Number')]//following-sibling::div[@class='value'][contains(.,'${tparty_prop_own_phn_no_input}')]
${appl_party_email}       xpath=//h3[@class='panel-heading'][contains(text(),'Property Owner')]//ancestor::div[@class='panel']//div[@class='title'][contains(text(),'Email')]//following-sibling::div[@class='value'][contains(.,'${tparty_prop_own_email_input}')]
${appl_party_address}       xpath=//h3[contains(text(),'Property Owner')]//ancestor::div[@class='panel-inner']//following-sibling::div//div[@class='title'][contains(text(),'Address')]//following-sibling::div[@class='value'][contains(.,'${tparty_prop_own_addr1_input}') and contains(.,'${tparty_prop_own_addr2_input}') and contains(.,'${tparty_prop_own_city_input}') and contains(.,'${tparty_prop_own_state_input}') and contains(.,'${tparty_prop_own_zip_input}')]

#---------Document Collection--------------
${appl_doc_coll_header_ele}       xpath=//h3[contains(text(),'${tappl_doc_coll_header_text}')]
${appl_doc_coll_file_ele}       xpath=//div[text()[contains(., '${tagreement_doc_name1}')]]

#---------Declarations--------------
${appl_decl_header_ele}       xpath=//h3[contains(text(),'${tappl_decl_header_text}')]
${appl_decl_applicant_ans_ele}       xpath=//strong[contains(text(),'Applicant Answer')]//parent::div[text()[contains(.,'${tappl_declarations_applicant_ans}')]]
${appl_decl_applicant_rel_ele}       xpath=//strong[contains(text(),'Relationship')]//parent::div[text()[contains(.,'${tappl_declarations_option}')]]
${appl_decl_applicant_exp_ele}       xpath=//strong[contains(text(),'Applicant Explanation')]//parent::div[text()[contains(.,'${tappl_declarations_written_stmt}')]]

#-------Signature------------
${appl_signature_header_ele}        xpath=//h3[contains(text(),'Signature')]
${appl_signature_pad}      //canvas[@class='sig-pad']
${appl_submit_btn}      xpath=//button[@type='submit'][contains(text(),'Submit')]
${appl_submit_msg}      xpath=//div[contains(text(),'Application Submitted')]




*** Keywords ***

ApplicationPage: Skip Step1
    [Documentation]    skips step1 in filling the application
    Wait Until Page Does Not Contain Element    ${loader_icon}  30
    Wait Until Page Contains Element    ${application_skip_btn}     30
#    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    1min     5secs    Scroll Element Into View     ${application_sub_heading}
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        5secs       Scroll Element Into View     ${application_skip_btn}
    Find And Click Element    ${application_skip_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     10

ApplicationPage: Validate application status
    [Arguments]     ${application_status}       ${proj_name}

    IF    ${application_status} == 'Denied Application'
    Wait Until Page Contains Element    xpath=//b[contains(text(),'${proj_name}')]//ancestor::tr//div[@class='badge badge-danger badge-outline-danger'][contains(text(),'DENIED APPLICATION')]     30
    END
    IF    ${application_status} == 'Approved Project'
    Wait Until Page Contains Element    xpath=//b[contains(text(),'${proj_name}')]//ancestor::tr//div[@class='badge badge-success badge-outline-success'][contains(text(),'APPROVED PROJECT')]     30
    END

ApplicationPage: Validate policy name
    [Documentation]    Validate policy name in the application
    Wait Until Page Contains Element    ${policy_name_text}
    Page Should Contain Element    ${policy_name_text}


ApplicationPage: Validate application step name
    [Documentation]    Validate application step name in the application
    Wait Until Page Contains Element    ${application_step_name_text}
    Page Should Contain Element    ${application_step_name_text}

ApplicationPage: Enter Project Description
    [Documentation]    Enters the project description in the application

    Wait Until Page Does Not Contain Element    ${loader_icon}  30
#    Wait Until Page Contains Element    ${no_loader_icon}       30
#    Wait Until Page Contains Element    ${appl_proj_name}     30
    Wait Until Page Contains Element    ${appl_proj_desc}     30
    Wait Until Page Contains Element    ${start_appl_btn}       30
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        5secs       Scroll Element Into View     ${appl_proj_desc}
#    Input Text for New Fields       ${appl_proj_name}        ${tappl_proj_name}
    Input Text for New Fields       ${appl_proj_desc}        ${tappl_proj_desc}
    Find And Click Element    ${start_appl_btn}
    Wait Until Element Is Not Visible    ${loader_icon}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20
    Wait Until Element Is Visible    ${step1_success_border}        20
#    Wait Until Element Is Visible    ${first_step_tick_mark}        30

ApplicationPage: Fill Proposed Project Info Details
    [Documentation]    Fills proposed project info details
    [Arguments]     ${proj_name}

    Wait Until Page Contains Element    ${prop_sq_foot}     60
    Wait Until Page Contains Element    //strong[contains(text(),'${proj_name}')]  30
    Run Keyword And Ignore Error    Scroll Element Into View    ${prop_sq_foot}
    Input Text for New Fields    ${prop_sq_foot}    ${tprop_sq_foot}
    Input Text for New Fields    ${est_fut_prop_value}    ${test_fut_prop_value}
    Run Keyword And Ignore Error    Scroll Element Into View    ${zone_change_dd}
    Find And Click Element    ${zone_change_dd}
    Wait Until Page Contains Element    ${zone_change_option}
    Find And Click Element    ${zone_change_option}
    Find And Click Element    ${proposed_property_use_dd}
    Wait Until Element Is Visible    ${proposed_property_use_option}
    Find And Click Element    ${proposed_property_use_option}
    Run Keyword And Ignore Error    Scroll Element Into View    ${exterior_ada_access_checkbx}
    Find And Click Element    ${exterior_ada_access_checkbx}
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
#           validate_elementvisible=${saved_success_msg}
#    Wait Until Element Is Visible    ${saved_success_msg}       30
#    Wait Until Element Is Not Visible    ${saved_success_msg}       20
    Wait Until Page Does Not Contain Element    ${prop_sq_foot}     30


ApplicationPage: Fill Property Info Details
    [Documentation]    Fills property info details
    [Arguments]     ${tappl_parcel_id1}

    Run Keyword And Ignore Error        Wait Until Page Contains Element    xpath=//div[contains(text(),'Loading...')]      60
    Run Keyword And Ignore Error        Wait Until Page Does Not Contain Element    xpath=//div[contains(text(),'Loading...')]      60
    Wait Until Page Contains Element    ${step1_element}        30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${parcel_alert_text_ele}        60
#    Wait Until Page Contains Element    ${first_step_without_tick_mark}        30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Does Not Contain Element    ${parcel_loading_ele}       30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${parcel_id_dd}     30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${next_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
#    Mouse Click    ${div_ele}
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcel_id_dd}
    Hover Mouse    ${parcel_id_dd}
#    Mouse Move      3       3
#    Wait Until Keyword Succeeds     1min        0.01sec
    Find And Click Element    ${parcel_id_dd}
    Input Text for New Fields    ${parcel_id_dd}    ${tappl_parcel_id1}
    Wait Until Page Contains Element    xpath=//div[contains(text(),'${tappl_parcel_id1}')]     20
    Run Keyword And Ignore Error    Scroll Element Into View     xpath=//div[contains(text(),'${tappl_parcel_id1}')]
    Hover Mouse    xpath=//div[contains(text(),'${tappl_parcel_id1}')]
    Find And Click Element    xpath=//div[contains(text(),'${tappl_parcel_id1}')]
    Wait Until Element Is Visible    ${parcel_ele}
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Validate deleted parcel Details
    [Documentation]    Validates deleted parcel details
    [Arguments]     ${tappl_parcel_id1}

    Wait Until Page Contains Element    xpath=//div[contains(text(),'Loading...')]      60
    Wait Until Page Does Not Contain Element    xpath=//div[contains(text(),'Loading...')]      60
    Wait Until Page Contains Element    ${step1_element}        30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${parcel_alert_text_ele}        30
#    Wait Until Page Contains Element    ${first_step_without_tick_mark}        30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Does Not Contain Element    ${parcel_loading_ele}       30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${parcel_id_dd}     30
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    ${next_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
#    Mouse Click    ${div_ele}
    Run Keyword And Ignore Error    Scroll Element Into View    ${parcel_id_dd}
    Wait Until Page Contains Element    ${parcel_id_dd}     30
    Hover Mouse    ${parcel_id_dd}
#    Mouse Move      3       3
#    Wait Until Keyword Succeeds     1min        0.01sec
    Find And Click Element    ${parcel_id_dd}
    Input Text for New Fields    ${parcel_id_dd}    ${tappl_parcel_id1}
    Wait Until Page Contains Element    xpath=//div[@class='dx-empty-message'][contains(text(),'No data')]     20

ApplicationPage: Fill Developer Info Details
    [Documentation]    Fills developer info details

#    Wait Until Page Contains Element    ${first_step_tick_mark}        30
    Wait Until Element Is Visible    ${dev_info_buss_icon_text}     60
    Wait Until Element Contains    ${dev_info_buss_icon_text}    ${tdev_info_buss_icon_text}
    Wait Until Page Contains Element    ${appl_selected_buss_ele}       60
    Run Keyword And Ignore Error    Scroll Element Into View    ${dev_info_buss_dd}
    Find And Click Element    ${dev_info_buss_radio}
    Hover Mouse    ${dev_info_buss_dd}
#    Find And Click Element    ${dev_info_buss_dd}
    Input Text for New Fields    ${dev_info_buss_dd}    ${tdev_info_buss_option}
    Find And Click Element    ${dev_info_buss_option}
    Wait Until Page Contains Element    ${dev_info_role_dd}
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        5secs       Scroll Element Into View     ${next_btn}
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        5secs    Scroll Element Into View     ${dev_info_buss_dd}
    Find And Click Element    ${dev_info_role_dd}
    Find And Click Element    ${dev_info_role_option}
    Run Keyword And Ignore Error    Scroll Element Into View     ${dev_info_realtionship_dd}
    Find And Click Element    ${dev_info_realtionship_dd}
    Run Keyword And Ignore Error    Scroll Element Into View     ${dev_info_relationship_option}
    Find And Click Element    ${dev_info_relationship_option}
    Run Keyword And Ignore Error    Scroll Element Into View     ${next_btn}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill Eligible Costs Details
    [Documentation]    Fills eligible costs details

#    Wait Until Page Contains Element    ${appl_land_acq_elg_cost_input}     30
#    Clear And Type Into Element    ${appl_land_acq_elg_cost_input}    ${tappl_land_acq_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_prop_assmb_elg_cost_input}
#    Clear And Type Into Element    ${appl_prop_assmb_elg_cost_input}    ${tappl_prop_assmb_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_site_prep_elg_cost_input}
#    Clear And Type Into Element    ${appl_site_prep_elg_cost_input}    ${tappl_site_prep_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_demolition_elg_cost_input}
#    Clear And Type Into Element    ${appl_demolition_elg_cost_input}    ${tappl_demolition_elg_cost_input}
    Wait Until Page Contains Element    ${appl_clearingOrgrading_elg_cost_input}        20
    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_clearingOrgrading_elg_cost_input}
    Clear And Type Into Element    ${appl_clearingOrgrading_elg_cost_input}    ${tclearingOrgrading_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_cost_of_rehab_elg_cost_input}
#    Clear And Type Into Element    ${appl_cost_of_rehab_elg_cost_input}    ${tappl_cost_of_rehab_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_elg_cost_to_new_const_input}
#    Clear And Type Into Element    ${appl_elg_cost_to_new_const_input}    ${tappl_elg_cost_to_new_const_input}
    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_other_elg_cost_input}
    Clear And Type Into Element    ${appl_other_elg_cost_input}    ${tother_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_reloc_cost_elg_cost_input}
#    Clear And Type Into Element    ${appl_reloc_cost_elg_cost_input}    ${tappl_reloc_cost_elg_cost_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_cost_of_studies_input}
#    Clear And Type Into Element    ${appl_cost_of_studies_input}    ${tappl_cost_of_studies_input}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_int_cost_input}
#    Clear And Type Into Element    ${appl_int_cost_input}    ${tappl_int_cost_input}
    Run Keyword And Ignore Error    Scroll Element Into View     ${next_btn}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill Financing details
    [Documentation]    Fills financing details

    Wait Until Keyword Succeeds    1min    5s    Wait Until Page Contains Element    ${appl_tot_est_proj_cst_input}       60
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_tot_est_proj_cst_input}
    Clear And Type Into Element    ${appl_tot_est_proj_cst_input}    ${ttot_est_proj_cst_input}
    Clear And Type Into Element    ${appl_req_tot_fund_amt_input}    ${treq_tot_fund_amt_input}
#    Clear And Type Into Element    ${appl_fin_det_dev_equity_input}    ${tappl_fin_det_dev_equity_input}
#    Run Keyword and Ignore Error    Scroll Element Into View    ${appl_fin_det_const_loans_input}
#    Clear And Type Into Element    ${appl_fin_det_const_loans_input}    ${tappl_fin_det_const_loans_input}
#    Scroll Element Into View    ${appl_fin_det_add_notes}
#    Clear And Type Into Element    ${appl_fin_det_add_notes}     ${tappl_fin_det_add_notes}
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}       
#    validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Visible    ${saved_success_msg}       20
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill Parties details
    [Documentation]    Fills parties details

    Wait Until Page Contains Element    ${party_prop_own_buss_name_input}      15
    Clear And Type Into Element    ${party_prop_own_buss_name_input}    ${tparty_prop_own_buss_name_input}
    Clear And Type Into Element    ${party_prop_own_buss_ein_input}    ${tparty_prop_own_buss_ein_input}
    Clear And Type Into Element    ${party_prop_own_first_name_input}    ${tparty_prop_own_first_name_input}
    Clear And Type Into Element    ${party_prop_own_last_name_input}    ${tparty_prop_own_last_name_input}
    Clear And Type Into Element    ${party_prop_own_phn_no_input}    ${tparty_prop_own_phn_no_input}
    Clear And Type Into Element    ${party_prop_own_email_input}    ${tparty_prop_own_email_input}
    Clear And Type Into Element    ${party_prop_own_addr1_input}    ${tparty_prop_own_addr1_input}
    Clear And Type Into Element    ${party_prop_own_addr2_input}    ${tparty_prop_own_addr2_input}
    Scroll Element Into View    ${party_prop_own_city_input}
    Clear And Type Into Element    ${party_prop_own_city_input}    ${tparty_prop_own_city_input}
    Clear And Type Into Element    ${party_prop_own_state_input}    ${tparty_prop_own_state_input}
    Clear And Type Into Element    ${party_prop_own_zip_input}    ${tparty_prop_own_zip_input}
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Hover Mouse    ${next_btn}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill estimated timeline
    [Documentation]    Fills estimated timeline

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_timeline_selection_dd}
    Find And Click Element    ${appl_timeline_selection_dd}
    Find And Click Element    ${appl_timeline_selection_option}
    Hover Mouse    ${appl_timeline_add_phase_btn}
    Find And Click Element    ${appl_timeline_add_phase_btn}
    Wait Until Element Is Enabled    ${appl_phasename1_input}
    Clear And Type Into Element    ${appl_phasename1_input}    ${tphase1_input}
    Clear And Type Into Element    ${appl_date1_input}    ${tdate1_input}
    Clear And Type Into Element    ${appl_description1_input}    ${tdescription1_input}
#    Scroll Element Into View    ${appl_responsible_party1_dd}
#    Hover Mouse    ${appl_responsible_party1_dd}
#    Find And Click Element    ${appl_responsible_party1_dd}
#    Hover Mouse    ${appl_responsible_party1_option1}
#    Find And Click Element    ${appl_responsible_party1_option1}
#    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_completion_status1_dd}
#    Hover Mouse    ${appl_completion_status1_dd}
#    Find And Click Element    ${appl_completion_status1_dd}
#    Hover Mouse    ${appl_completion_status1_option1}
#    Find And Click Element    ${appl_completion_status1_option1}
#    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_updated_datetime1_input}
#    Clear And Type Into Element    ${appl_updated_datetime1_input}    ${tupdated_datetime1_input}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill Projections
    [Documentation]    fills projections

    Wait Until Element Is Visible    ${appl_proj_jobs_created_textbox}     10
    Wait Until Element Is Visible    ${appl_proj_jobs_created_textbox}
    Input Text for New Fields    ${appl_proj_jobs_created_textbox}       ${tproj_jobs_created_textbox}
    Wait Until Element Is Visible    ${appl_proj_jobs_retained_textbox}
    Input Text for New Fields    ${appl_proj_jobs_retained_textbox}       ${tproj_jobs_retained_textbox}
    Wait Until Element Is Visible    ${appl_proj_trees_planted_textbox}
    Input Text for New Fields    ${appl_proj_trees_planted_textbox}       ${tproj_trees_planted_textbox}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       20
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill Documentation Collection
    [Documentation]    fills documentation collection

#    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_doc_coll_upload_btn}
#    Upload File from Desktop using Autoit        ${appl_doc_coll_upload_btn}     ${appl_doc_coll_fileloc}
    Run Keyword And Ignore Error        Scroll Element Into View     ${appl_uploaded_btn_text}
    Choose File From Desktop    ${appl_upload_agrmt_doc}     ${agrmt_fileloc1}
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_doc_coll_upload_icon}
    Find And Click Element    ${appl_doc_coll_upload_icon}
    Wait Until Page Contains Element    xpath=//div[contains(text(),'${tagreement_doc_name1}')]
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Fill Declarations
    [Documentation]    Fills declarations

    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Wait Until Page Contains Element    //div[@class='alert alert-info'][contains(text(),'If you have any questions')]      60
    Wait Until Page Contains Element    xpath=//div[@class='declaration-panel']     60
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_declarations_radio}
    Wait Until Page Does Not Contain Element    ${loader_icon}      30
    Find And Click Element    ${appl_declarations_radio}
    Wait Until Element Is Visible    ${selected_appl_declarations_yes_radio}        30
    Wait Until Element Is Visible    ${appl_declarations_dd}        20
    Hover Mouse    ${appl_declarations_dd}
    Find And Click Element    ${appl_declarations_dd}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_declarations_option}
    Find And Click Element    ${appl_declarations_option}
    Run Keyword And Ignore Error    Scroll Element Into View     ${appl_declarations_written_stmt}
    Clear And Type Into Element    ${appl_declarations_written_stmt}    ${tappl_declarations_written_stmt}
    Find And Click Element    ${next_btn}       validate_elementvisible=${saved_success_msg}
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

Convert To Amt: Convert string to dollars
    [Documentation]    convert string to dollars
    [Arguments]     ${value}

    ${number3}= 		Set Variable	${value}
    ${currstring} = 	Evaluate		"{:,.0f}".format(${number3})
    ${number2} = 		Catenate    $${currstring}.00
    [Return]        ${number2}

ApplicationPage: Validate Applicant Info In Summary Details
    [Documentation]    validates applicant info in summary page

    Wait Until Page Contains Element    ${appl_applicnt_info_header_ele}    30
    Wait Until Page Contains Element    ${appl_applicnt_type_ele}       10
    Wait Until Page Contains Element    ${appl_applicnt_name_ele}       10
#    Wait Until Page Contains Element    ${appl_applicnt_intention_ele}
    Wait Until Page Contains Element    ${appl_applicnt_buss_name_ele}      60

ApplicationPage: Validate Property Info In Summary Details
    [Documentation]    validates property info in summary page

    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_property_info_header_ele}
    Wait Until Page Contains Element    ${appl_property_info_header_ele}    30
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_prop_info_parcel_id_ele}
    Wait Until Page Contains Element    ${appl_prop_info_parcel_id_ele}


ApplicationPage: Validate Proposed Project Info Details
    [Documentation]    validates proposed project info in summary page

    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_proposed_proj_header_ele}
    Wait Until Page Contains Element    ${appl_proposed_proj_header_ele}    30
    Run Keyword And Ignore Error    Scroll Element Into View    ${appl_prop_use_ele}
    Wait Until Page Contains Element    ${appl_proposed_sqfoot_ele}
    ${test_fut_prop_value_amt}=       Convert To Amt: Convert string to dollars       ${test_fut_prop_value}
    Wait Until Page Contains Element        xpath=//div[@class='title'][contains(text(),'Estimated Future Assessed Value')]//following-sibling::div[@class='value'][contains(text(),'${test_fut_prop_value_amt}')]
#    ${appl_fut_prop_value_ele}
    Wait Until Page Contains Element    ${appl_prop_use_ele}

ApplicationPage: Validate Eligible Costs Info Details
    [Documentation]    validates eligible costs info in summary page

    ${tappl_clearingOrgrading_elg_cost_input_amt}=       Convert To Amt: Convert string to dollars       ${tappl_clearingOrgrading_elg_cost_input}
    Wait Until Keyword Succeeds    1min    0.0001sec    Scroll Element Into View    xpath=//td//div[contains(text(),'Clearing / Grading')]//parent::td//following-sibling::td[contains(text(),'${tappl_clearingOrgrading_elg_cost_input_amt}')]
    Wait Until Page Contains Element        xpath=//td//div[contains(text(),'Clearing / Grading')]//parent::td//following-sibling::td[contains(text(),'${tappl_clearingOrgrading_elg_cost_input_amt}')]
    ${tappl_other_elg_cost_input_amt}=       Convert To Amt: Convert string to dollars       ${tappl_other_elg_cost_input}
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//td//div[contains(text(),'Other')]//parent::td//following-sibling::td[contains(text(),'${tappl_other_elg_cost_input_amt}')]
    Wait Until Page Contains Element        xpath=//td//div[contains(text(),'Other')]//parent::td//following-sibling::td[contains(text(),'${tappl_other_elg_cost_input_amt}')]


ApplicationPage: Validate Financing Details
    [Documentation]    validates financing details in summary page

    ${tappl_req_tot_fund_amt_input_amt}=       Convert To Amt: Convert string to dollars       ${tappl_req_tot_fund_amt_input}
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//td[contains(text(),'Total Funding Amount Requested')]//following-sibling::td[contains(text(),'${tappl_req_tot_fund_amt_input_amt}')]
    Wait Until Page Contains Element    ${appl_fin_det_header_ele}    30
    ${tappl_tot_est_proj_cst_input_amt}=       Convert To Amt: Convert string to dollars       ${tappl_tot_est_proj_cst_input}
    Wait Until Page Contains Element        xpath=//td[contains(text(),'Total Estimated Project Cost')]//following-sibling::td[contains(text(),'${tappl_tot_est_proj_cst_input_amt}')]
    Wait Until Page Contains Element        xpath=//td[contains(text(),'Total Funding Amount Requested')]//following-sibling::td[contains(text(),'${tappl_req_tot_fund_amt_input_amt}')]
    ${appl_elig_costs_sum}=  Evaluate    ${tappl_clearingOrgrading_elg_cost_input} + ${tappl_other_elg_cost_input}
    ${teligible_costs_total_doll}=       TestData: Convert string to dollars   ${appl_elig_costs_sum}
    Wait Until Page Contains Element        xpath=//tr//td[contains(text(),'Eligible Costs Total')]//following-sibling::td[contains(text(),'${teligible_costs_total_doll}')]

ApplicationPage: Validate Estimated Timeline
    [Documentation]    validates estimated timeline in summary page

    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_est_timeline_header_ele}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_est_timeline_res_party_ele}
    Wait Until Page Contains Element        ${appl_est_timeline_header_ele}
    Wait Until Page Contains Element        ${appl_est_timeline_desc_ele}
    Wait Until Page Contains Element        ${appl_est_timeline_res_party_ele}
    #--date conversion to be done yet

ApplicationPage: Validate Projections
    [Documentation]    validates projections in summary page

    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_projections_header_ele}
#    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_projections_trees_planted}
    Wait Until Page Contains Element        ${appl_projections_jobs_created}
    Wait Until Page Contains Element        ${appl_projections_jobs_retained}
    Wait Until Page Contains Element        ${appl_projections_trees_planted}


ApplicationPage: Validate Parties
    [Documentation]    validates parties in summary page

    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_party_header_ele}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_party_prop_own_header_ele}
    Wait Until Page Contains Element        ${appl_party_name}
    Wait Until Page Contains Element        ${appl_party_business_name}
#    Wait Until Page Contains Element        ${appl_party_phone}
    Wait Until Page Contains Element        ${appl_party_email}
    Wait Until Page Contains Element        ${appl_party_address}

ApplicationPage: Validate Document Collection
    [Documentation]    validates document collection in summary page

    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_doc_coll_header_ele}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_doc_coll_file_ele}
    Wait Until Page Contains Element        ${appl_doc_coll_file_ele}

ApplicationPage: Validate Declarations
    [Documentation]    validates document collection in summary page

    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_decl_header_ele}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_decl_applicant_exp_ele}
    Wait Until Page Contains Element        ${appl_decl_applicant_ans_ele}
    Wait Until Page Contains Element        ${appl_decl_applicant_rel_ele}
    Wait Until Page Contains Element        ${appl_decl_applicant_exp_ele}


ApplicationPage: Perform Signature And Submit
    [Documentation]    performs signature in summary page and submit application

    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_signature_header_ele}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_signature_pad}
    Wait Until Page Contains Element        ${appl_signature_pad}
    Perform Sign    ${appl_signature_pad}
#    Input Text for New Fields    ${appl_signature_pad}    ${tloggedin_applicant_name}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_decl_header_ele}
    Run Keyword And Ignore Error    Scroll Element Into View        ${appl_submit_btn}
    Find And Click Element      ${appl_submit_btn}
    Wait Until Element Is Visible    ${appl_submit_msg}     30

ApplicationPage: Move from dev info to Next step without Any Action
    [Documentation]    move from dev info  to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${appl_selected_buss_ele}        20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       30
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Move from prop info to Next step without Any Action
    [Documentation]    move from prop info  to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${appl_selected_parcelid}        20
    Wait Until Page Contains Element    ${appl_selected_parcelid1}        20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       30
#    Wait Until Element Is Not Visible    ${saved_success_msg}       30

ApplicationPage: Move from doc coll to Next step without Any Action
    [Documentation]    move from doc doll to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${appl_doc_coll_file_ele}        20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       30
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Move from eligible costs to Next step without Any Action
    [Documentation]    move from eligible costs to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${appl_clearingOrgrading_ele_text}        20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       30
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

 ApplicationPage: Move from projections to Next step without Any Action
    [Documentation]    move from projections to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${appl_proj_text}        20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       30
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

 ApplicationPage: Move from estimated timeline to Next step without Any Action
    [Documentation]    move from estimated timeline to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${appl_timeline_text}        20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
    Wait Until Element Is Visible    ${saved_success_msg}       30
    Wait Until Element Is Not Visible    ${saved_success_msg}       20

ApplicationPage: Move to Next step without Any Action
    [Documentation]    move to next step without any action

    Wait Until Element Is Not Visible    ${loader_icon}     20
    Wait Until Page Contains Element    ${next_btn}     10
    Run Keyword And Ignore Error    Scroll Element Into View    ${next_btn}
    Find And Click Element    ${next_btn}
#    Wait Until Element Is Visible    ${saved_success_msg}       30
#    Wait Until Element Is Not Visible    ${saved_success_msg}       20


