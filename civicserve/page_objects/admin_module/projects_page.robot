*** Settings ***
Documentation    This file contians page objects for projects page.

Resource         ../../test_data/testdata.robot
Resource    ../../../global_shared_resources/custom_functions/global_element_functions.robot
Resource    ../../../global_shared_resources/custom_functions/global_helper_functions.robot
Resource    admin_homepage.robot

Library    SeleniumLibrary
Library    XML
Library    Collections
Library    String
#Library    AutoItLibrary

*** Variables ***

#Create Project
${create_proj_btn}      xpath=//a[@href='/admin/projects/new']
${create_proj_header}       xpath=//h3[contains(text(),'Create')]
${proj_name}        xpath=//input[@name='name']
#//input[@name='projectName']
${proj_desc}        xpath=//textarea[@name='description']
${incentive_program_dd}        xpath=//span[contains(text(),'Incentive Program:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${loader_icon}      xpath=//div[@id='loader'][@style='display: block;']
${no_loader_icon}      xpath=//div[@id='loader'][@style='display: none;']
${incentive_program_fac_option}        xpath=//div[@role='option']//div[contains(text(),'Façade Improvement Grant')]
${incentive_program_bdd_option}        xpath=//div[@role='option']//div[contains(text(),'BDD')]
${proj_tier_dd}     xpath=//span[contains(text(),'Project Tier:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${proj_tier_maj_cat_option}     xpath=//div[@role='option']//div[contains(text(),'${tproj_type}')]
${parcel_dd}        xpath=//span[contains(text(),'Parcel')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${parcel_option}        xpath=//div[contains(text(),'${tappl_parcel_id1}')]
${district_dd}      xpath=//span[contains(text(),'District')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${district_option}        xpath=//div[contains(text(),'North Main St TIFf')]
${assign_bus_radio}     xpath=//div[@class='dx-item-content'][1]
${assign_ind_radio}     xpath=//div[@class='dx-item-content'][2]
${sel_buss_dd}      xpath=//span[contains(text(),'Select business')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${bus_option}       xpath=//div[contains(text(),'${tproj_buss}')]
${assigned_user_dd}     xpath=//span[contains(text(),'Assigned User')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${assigned_user_option}     xpath=//div[contains(text(),'${tproj_ind}')]
${applicant_dd}     xpath=//span[contains(text(),'Select Applicant Already In The System:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${applicant_john_option}        xpath=//div[contains(text(),'John Developer-johndeveloper@civicserv.com')]
${down_proj_create_btn}       xpath=//span[contains(text(),'Create')]
${added_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record saved successfully!')]

#Edit Project
${proj_page_cnt}              xpath=//div[@class='dx-pages-count']
${proj_nxt_pg}              xpath=//div[@aria-label='Next Page']
${search_ip}     xpath=//input[@name='search']
${filter_btn}     xpath=//button[@class='btn btn-primary'][contains(text(),'Filter')]
${search_proj_edit}     xpath=//p[text()[contains(., '${tsearch_ip}')]]//ancestor::td//following-sibling::td//a[@class='btn btn-info']
${approval_status_edit}     xpath=//div[contains(text(),'Approval Status')]//following-sibling::div//*[local-name()='svg'][@data-icon='pen-to-square']
${approval_status_text}     xpath=//div[contains(text(),'Approval Status')]//following-sibling::div
${approval_status_select}     xpath=//label//span[contains(text(),'Approval Status')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${approval_status_approve_option}     xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Approved Project')]
${date_project_opened}     xpath=//span[contains(text(),'Date Project Opened')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${estimated_closed_date}     xpath=//span[contains(text(),'Estimated Closed Date')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${max_approved_amt}     xpath=//span[contains(text(),'Maximum Approved Amount')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${type_of_repaymt_dd}     xpath=//span[contains(text(),'Type of Repayment')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${type_of_repaymt_option}     xpath=//div[contains(text(),'Fund Payment')]
${add_new_fund_paymt_btn}       xpath=//span[@class='dx-button-text'][contains(text(),'Add New Fund Payment')]
${amt_per_year}     xpath=//span[contains(text(),'Amount Per Year')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${est_proj_term}        xpath=//span[contains(text(),'Estimated Project Term')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${remove_fund_paymt_btn}        xpath=//a[contains(text(),'Remove Fund Payment')]
${approval_status_save_btn}     xpath=//span[contains(text(),'Save')]
${approval_status_denied_option}     xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'Denied Application')]
${date_project_denied}     xpath=//span[contains(text(),'Date Project Denied')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${denied_note}     xpath=//span[contains(text(),'Note')]//ancestor::label//following-sibling::div//textarea[@name='internalNotes']
${approval_status_closed_option}     xpath=//div[contains(text(),'Closed Project')]
${date_project_closed_out}     xpath=//label[contains(text(),'Date Project Closed Out:')]//following-sibling::div//input
${approval_status_card_text}     xpath=//div[@class='title'][contains(text(),'Approval Status')]//following-sibling::div[@class='value'][contains(text(),'${exp_active_text}')]

#Main Project Info
${prog_or_dist_name}        xpath=//div[@class='title'][contains(text(),'Program / District')]//following-sibling::div
${applicant_name}        xpath=//strong[contains(.,'Applicant Name')]//parent::div[@class='panel']
${application_proj_tier}       xpath=//div[@class='title'][contains(text(),'Project Tier')]//following-sibling::div
${overall_impact_score}       xpath=//div[@class='title'][contains(text(),'Overall Impact Score')]//following-sibling::div
${total_estimate_project_cost}      xpath=//div[@class='title'][contains(text(),'Total Estimated Project Cost')]//following-sibling::div
${total_eligible_costs}     xpath=//div[@class='title'][contains(text(),'Total Eligible Costs')]//following-sibling::div
${total_funding_requested}      xpath=//div[@class='title'][contains(text(),'Total Funding Requested')]//following-sibling::div
${total_funding_offered}        xpath=//div[@class='title'][contains(text(),'Total Funding Offered')]//following-sibling::div
${approval_status}          xpath=//div[@class='title'][contains(text(),'Approval Status')]//following-sibling::div

#Project Details
${overview_det_header}        xpath=//h3[contains(text(),'Details')]
${proj_det_proj_name}        xpath=//div[@class='title'][contains(text(),'Project Name')]//following-sibling::div
${proj_det_proj_desc}        xpath=//div[@class='title'][contains(text(),'Description')]//following-sibling::div
${proj_tier}        xpath=//div[@class='title'][contains(text(),'Project Tier')]//following-sibling::div
${proj_status}      xpath=//div[@class='title'][contains(text(),'Current Consideration Status')]//following-sibling::div

#Property information
${prop_info}        xpath=//span[contains(text(),'${prop_info_title}')]
${parcel_id}        xpath=//div[@class='title'][contains(text(),'Parcel ID')]//following-sibling::div
#${parcel_addr}      xpath=//div[]
${last_assessment}     xpath=//div[@class='title'][contains(text(),'Last Assessment')]//following-sibling::div
${proposed_sqft}       xpath=//div[@class='title'][contains(text(),' Proposed SqFt')]//following-sibling::div
${proposed_use}        xpath=//div[@class='title'][contains(text(),'Proposed Use')]//following-sibling::div
${proposed_estd_fav}       xpath=//div[@class='title'][contains(text(),'Estimated Future Assessed Value')]//following-sibling::div
#parking
${max_cap}     xpath=//div[@class='title'][contains(text(),'Maximum Capacity')]//following-sibling::div
#construction activites
${interior}
${exterior}
${structural}
${land}

#Property Info edit popup
${prop_info_edit_btn}       xpath=//button[contains(text(),'Edit Associated Project Parcels')]
${prop_info_parcel_id}       xpath=//span[contains(text(),'${tappl_parcel_id1}')]
${prop_info_popup_alert_info_text}       xpath=//div[@class='alert alert-info']
${prop_info_edit_parcel_textbox}       xpath=//div[@class='dx-texteditor-input-container dx-tag-container']//input[@autocomplete='off'][@role='combobox']
#//div[@class='dx-show-invalid-badge dx-tagbox dx-tagbox-only-select dx-selectbox dx-textbox dx-texteditor dx-show-clear-button dx-editor-outlined dx-widget dx-tagbox-default-template dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler']
#//div[@class='dx-show-invalid-badge dx-tagbox dx-tagbox-only-select dx-selectbox dx-textbox dx-texteditor dx-show-clear-button dx-editor-outlined dx-texteditor-empty dx-widget dx-tagbox-default-template dx-dropdowneditor dx-dropdowneditor-field-clickable dx-validator dx-visibility-change-handler dx-invalid']
${prop_info_edit_parcel_dd}            xpath=//div[contains(text(),'Update parcels')]//ancestor::div[@role='toolbar']//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input[@autocomplete='off']
${prop_info_edit_parcel_options}       xpath=//div[contains(text(),'${tedit_prop_info_parcel_id1}')]
${prop_info_popup_ok_btn}           xpath=//span[contains(text(),'Ok')]
${prop_info_new_added_parcel_id}            xpath=//div[@class='value'][contains(text(),'B1127')]


#Developer info
${dev_info}         xpath=//span[contains(text(),'${dev_info_title}')]
${dev_info_header}         xpath=//h5[contains(text(),'Developer Info')]
#Applicant Info
${applicant_type}       xpath=//div[@class='title'][contains(text(),'Applicant Type')]//following-sibling::div
${dev_info_applicant_name}       xpath=//div[contains(text(),'Applicant Type')]//parent::div//parent::div//following-sibling::div//div[@class='title'][contains(text(),'Name')]//following-sibling::div
#Dev Prof
${dev_prof_header}      xpath=//h3[contains(text(),'Developer Profile')]
${buss_name}        xpath=//div[@class='title'][contains(text(),'Business Name')]//following-sibling::div
${phone}            xpath=//div[@class='title'][contains(text(),'Phone')]//following-sibling::div
${dev_email}            xpath=//div[@class='title'][contains(text(),'Email')]//following-sibling::div
${phy_addr}         xpath=//div[@class='title'][contains(text(),'Physical Address')]//following-sibling::div
${mail_addr}        xpath=//div[@class='title'][contains(text(),'Mailing Address')]//following-sibling::div
${years_in_buss}        xpath=//div[@class='title'][contains(text(),'Years In Business')]//following-sibling::div
#Relationship to City
${relationship_to_city_header}      xpath=//h3[contains(text(),'Relationship To City')]
${intention}        xpath=//div[@class='title'][contains(text(),'Intention')]//following-sibling::div
#Developer History
${dev_hist_developer}       xpath=//tr//td[contains(text(),'${tdev_hist_dev_name}')]
${dev_hist_company}       xpath=//tr//td[contains(text(),'${tdev_hist_company}')]
${dev_hist_contact}       xpath=//tr//td[contains(text(),'${tdev_hist_cont}')]
${dev_hist_addr}       xpath=//tr//td[contains(text(),'${tdev_hist_addr}')]

#Dev Info Edit Popup
${dev_info_edit_btn}       xpath=//button[contains(text(),'Edit Applicant Info')]
${dev_info_popup_buss_radio}        xpath=//div[@role='radio']//div[@class='dx-item-content'][contains(text(),'Business')]
${selected_buss_ele}        xpath=//input[@name='selectedBusinessId']
${selected_app_role_ele}        xpath=//input[@name='ApplicantRoleInProject'][@value='0']
${dev_info_popup_ind_radio}        xpath=//div[@role='radio']//div[@class='dx-item-content'][contains(text(),'Individual')]
${dev_info_popup_app_dd}           xpath=//span[contains(text(),'Select Applicant Already In The System:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_popup_app_option}           xpath=//div[@role='option']//div[contains(text(),'${tdev_info_popup_app_option}')]
${dev_info_popup_buss_dd}           xpath=//span[contains(text(),'Select business')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_popup_buss_option}       xpath=//div[@role='option']//div[contains(text(),'${tdev_info_popup_buss_option}')]
${dev_info_popup_assigned_user_dd}      xpath=//span[contains(text(),'Assigned User:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_popup_assigned_user_option}      xpath=//div[@role='option']//div[contains(text(),'${tdev_info_popup_ind_option}')]
${dev_info_popup_ind_dd}            xpath=//span[contains(text(),'Assigned User:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_popup_ind_option}        xpath=//div[@role='option']//div[contains(text(),'${tdev_info_popup_ind_option}')]
${dev_info_popup_role_dd}        xpath=//span[contains(text(),'Please select your role in this proposed project')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_popup_role_option}        xpath=//div[@role='option']//div[contains(text(),'${tdev_info_popup_role_option}')]
${dev_info_popup_realtionship_dd}        xpath=//span[contains(text(),'Proposed Relationship:')]//ancestor::label//following-sibling::div//div[@class='dx-dropdowneditor-input-wrapper dx-selectbox-container']//div[@class='dx-texteditor-container']//input
${dev_info_popup_relationship_option}        xpath=//div[@role='option']//div[contains(text(),'${tdev_info_popup_relationship_option}')]
${dev_info_popup_ok_btn}           xpath=//span[contains(text(),'Ok')]
#//span[contains(text(),'Ok')]
${scrollele}     .dx-popup-content  .dx-scrollable-container
#Eligible Costs
${elig_costs}       xpath=//span[contains(text(),'${eligible_costs_title}')]
${acquistion_subtotal_value}     xpath=//h3[contains(text(),'Acquisition')]//ancestor::div[@class='panel']//tr//td[contains(text(),'Sub Total')]//following-sibling::td
${demolition_subtotal_value}        xpath=//h3[contains(text(),'Demolition')]//ancestor::div[@class='panel']//tr//td[contains(text(),'Sub Total')]//following-sibling::td
${site_clearance_subtotal_value}        xpath=//h3[contains(text(),'Site Clearance / Preparation')]//ancestor::div[@class='panel']//tr//td[contains(text(),'Sub Total')]//following-sibling::td
${soft_costs_subtotal_value}            xpath=//h3[contains(text(),'Soft Costs')]//ancestor::div[@class='panel']//tr//td[contains(text(),'Sub Total')]//following-sibling::td
${other_subtotal_value}          xpath=//h3[contains(text(),'Other')]//ancestor::div[@class='panel']//tr//td[contains(text(),'Sub Total')]//following-sibling::td

#Eligible Costs Edit Popup

${elg_costs_edit_btn}       xpath=//button[contains(text(),'Edit Eligible Costs')]
${cat_input}         xpath=//span[contains(text(),'Categories:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${elg_cost_desc_input}      xpath=//span[contains(text(),'Eligible Cost Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

${land_acq_elg_cost_input}           xpath=//span[contains(text(),'Acquisition')]//following-sibling::div//span[contains(text(),'Land Acquisition')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${prop_assmb_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Property Assembly Costs')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${site_prep_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Site Preparations')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${demolition_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Demolition')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${clearingOrgrading_elg_cost_input}        xpath=//span[contains(text(),'Site Clearance / Preparation')]//following-sibling::div//span[contains(text(),'Clearing / Grading')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${cost_of_rehab_elg_cost_input}     xpath=//span[contains(text(),'Building Costs')]//following-sibling::div//span[contains(text(),'Cost of rehabilitation or remodeling of existing buildings')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${elg_cost_to_new_const_input}      xpath=//span[contains(text(),'Building Costs')]//following-sibling::div//span[contains(text(),'Eligible costs relating to new construction')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${other_elg_cost_input}     xpath=//span[contains(text(),'Other')]//following-sibling::div//span[contains(text(),'Other')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${reloc_cost_elg_cost_input}        xpath=//span[contains(text(),'Soft Costs')]//following-sibling::div//span[contains(text(),'Relocation costs')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${cost_of_studies_input}        xpath=//span[contains(text(),'Soft Costs')]//following-sibling::div//span[contains(text(),'Cost of studies')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${int_cost_input}       xpath=//span[contains(text(),'Soft Costs')]//following-sibling::div//span[contains(text(),'Interest cost')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${elg_cost_popup_ok_btn}           xpath=//div[@class='dx-overlay-content dx-popup-normal dx-resizable']//span[contains(text(),'Save')]

#Financing Details
${fin_det}       xpath=//span[contains(text(),'${financing_details_title}')]
#Fund Request
${funding_request}          xpath=//tr//td[contains(text(),'Funding Request')]//following-sibling::td
${eligible_costs_total}         xpath=//tr//td[contains(text(),'Eligible Costs Total')]//following-sibling::td
${total_estimated_project_cost}         xpath=//tr//td[contains(text(),'Total Estimated Project Cost')]//following-sibling::td
${total_funding_amt_req}            xpath=//tr//td[contains(text(),'Total Funding Amount Requested')]//following-sibling::td
${upfront_funding_amt_req}          xpath=//tr//td[contains(text(),'Up Front Funding Amount Requested')]//following-sibling::td
${pay_go_funding_amt_req}           xpath=//tr//td[contains(text(),'Pay Go Funding Amount Requested')]//following-sibling::td
#Funding Program Intiative Assignments
${funding_program_intiative_assignments}        xpath=//h3[contains(text(),'Funding Program Initiative Assignments')]
#Equity
${dev_equity}           xpath=//tr//td[contains(text(),'Developer Equity')]//following-sibling::td
${other_equity}
${equity_subtotal}      xpath=//h3[contains(text(),'Equity')]//parent::div//following-sibling::div//td[contains(text(),'Sub Total')]//following-sibling::td
#Loans
${construction_financing}
${permanent_financing}
${government_loans}
${loan_subtotal}        xpath=//h3[contains(text(),'Loans')]//parent::div//following-sibling::div//td[contains(text(),'Sub Total')]//following-sibling::td
#Other
${other_subtotal}       xpath=//h3[contains(text(),'Other')]//parent::div//following-sibling::div//td[contains(text(),'Sub Total')]//following-sibling::td
#Additional notes or comments

#Financing Details Edit Popup
${fin_det_fund_req_text}     xpath=//td[contains(text(),'Funding Request')]
${fin_det_edit_btn}     xpath=//button[@class='btn btn-primary'][contains(text(),'Edit Financial Details')]
${req_fun_typ_dd}     xpath=//span[contains(text(),'Requested Funding Type')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${req_fun_typ_option}     xpath=//div[contains(text(),'Pay As You Go')]
${req_fun_typ_ele}     xpath=//input[@name='projectFundingRequestType'][@value='0']
${est_elg_cost_totl_input}        xpath=//span[contains(text(),'Estimated Eligible Costs Total:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${tot_est_proj_cst_input}        xpath=//span[contains(text(),'Total Estimated Project Cost:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${rec_tot_fund_amt_input}     xpath=//span[contains(text(),'Recommended Funding Amount::')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${req_upfrnt_fund_amt_input}      xpath=//span[contains(text(),'Requested Up Front Funding Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${req_pay_go_fund_amt_input}      xpath=//span[contains(text(),'Requested Pay Go Funding Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${fin_det_dev_equity_input}       xpath=//span[contains(text(),'Equity')]//following-sibling::div//span[contains(text(),'Developer Equity')]//following-sibling::div//span[contains(text(),'Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${fin_det_const_loans_input}      xpath=//span[contains(text(),'Loans')]//following-sibling::div//span[contains(text(),'Construction Loans')]//following-sibling::div//span[contains(text(),'Amount:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${fin_det_add_notes}        xpath=//span[contains(text(),'Additional Notes / Comments:')]//ancestor::label//following-sibling::div//textarea
${fin_det_ok_btn}        xpath=//div[@class='dx-overlay-content dx-popup-normal dx-resizable']//span[contains(text(),'Save')]

#Estimated Timeline
${es_timeline}          xpath=//span[contains(text(),'${estimated_timeline_title1}')]
${es_strt_dt}           xpath=//div[@class='time-line'][1]//div[@class='time']
${es_title1}             xpath=//div[@class='time-line'][1]//div[@class='data']//strong
${es_desc1}             xpath=//div[@class='time-line'][1]//div[@class='data']//div
${es_mid_dt}            xpath=//div[@class='time-line'][2]//div[@class='time']
${es_desc2}             xpath=//div[@class='time-line'][2]//div[@class='data']//div
${es_end_dt}            xpath=//div[@class='time-line'][3]//div[@class='time']
${es_desc3}             xpath=//div[@class='time-line'][3]//div[@class='data']//div

#Estimated Timeline Edit popup
${es_timeline_edit_btn}     xpath=//a[contains(.,'Edit') and contains(.,'Timeline')]
${timeline_selection_dd}        xpath=//select[@id='timeline-selection']
${timeline_selection_option}        xpath=//option[contains(text(),'We have a target timeline')]
${timeline_selection_dd_selectedtext}        xpath=//option[@value='true'][contains(text(),'We have a target timeline')]
${timeline_add_phase_btn}        xpath=//button[contains(text(),'Add Additional Phase')]

#1
${phase1_input}       xpath=//label//span[contains(text(),'Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${date1_input}      xpath=//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${description1_input}       xpath=//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party1_dd}       xpath=//select//following-sibling::div[1]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party1_option1}       xpath=//div[contains(text(),'${tappl_responsible_party_input}')]
${completion_status1_dd}        xpath=//select//following-sibling::div[1]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${completion_status1_option1}        xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tcompletion_status1_option}')]
${updated_datetime1_input}        xpath=//select//following-sibling::div[1]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
#2
${phase2_input}       xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Phase:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${date2_input}      xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${description2_input}       xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party2_dd}       xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party2_option1}       xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_responsible_party_input}')]
${completion_status2_dd}        xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${completion_status2_option1}        xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tcompletion_status1_option}')]
${updated_datetime2_input}        xpath=//select//following-sibling::div[2]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date/Time:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
#3
${phase3_input}       xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Phase:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${date3_input}      xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${description3_input}       xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party3_dd}       xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party3_option1}       xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_responsible_party_input}')]
${completion_status3_dd}        xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${completion_status3_option1}        xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tcompletion_status1_option}')]
${updated_datetime3_input}        xpath=//select//following-sibling::div[3]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date/Time:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

${add_additional_phase_btn}     xpath=//button[contains(text(),'Add Additional Phase')]
#4
${phase4_input}       xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Phase:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${date4_input}      xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Date:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${description4_input}       xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Description:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party4_dd}       xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Responsible Party:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${responsible_party4_option1}       xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tappl_responsible_party_input}')]
${completion_status4_dd}        xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Completion Status:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${completion_status4_option1}        xpath=//div[@class='dx-item dx-list-item dx-list-item-selected']//following-sibling::div//div[contains(text(),'${tcompletion_status1_option}')]
${updated_datetime4_input}        xpath=//select//following-sibling::div[4]//h3[@class='panel-heading'][contains(text(),'#')]//parent::div[@class='panel-inner']//following-sibling::div[1]//label//span[contains(text(),'Updated Date/Time:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']

${es_timeline_submit_btn}       xpath=//span[contains(text(),'Ok')]


#Projections
${projections}          xpath=//span[contains(text(),'${projections_title}')]

${projections_edit_btn}     xpath=//a[contains(.,'Edit') and contains(.,'Projections')]
#Estimated Jobs Numbers
${est_tot_no_of_fte_jobs}
${est_no_of_jobs_ctd}       xpath=//div[@class='title'][contains(text(),'Jobs Created')]//following-sibling::div[@class='value']
${est_no_of_jobs_rtd}       xpath=//div[@class='title'][contains(text(),'Jobs Retained')]//following-sibling::div[@class='value']
${est_no_of_trees_plntd}       xpath=//div[@class='title'][contains(text(),'Trees Planted')]//following-sibling::div[@class='value']
#Actual Jobs Numbers
${act_tot_no_of_fte_jobs}
${act_no_of_jobs_ctd}
${act_no_of_jobs_rtd}
#Avg Sal of Jobs
${avg_pay_of_mgmt}
${avg_pay_of_sal_emp}
${avg_pay_of_hrly_emp}
${job_title}
#No of Trees Planted
${typ_of_tree}
${no_of_tree}       xpath=//h3[contains(text(),'Trees Planted')]//parent::div[@class='panel-inner']//following-sibling::div//div[@class='value']
${add_another_btn_ele}      xpath=//button[contains(text(),'Add Another')]
${proj_jobs_created_add_another_btn}      xpath=//h3[contains(text(),'Jobs Created')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//button[contains(text(),'Add Another')]
${proj_jobs_created_textbox}      xpath=//span[contains(text(),'Jobs Created')]//ancestor::label//following-sibling::div//input[@type='text']
${proj_jobs_retained_add_another_btn}      xpath=//h3[contains(text(),'Jobs Retained')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//button[contains(text(),'Add Another')]
${proj_jobs_retained_textbox}      xpath=//span[contains(text(),'Jobs Retained')]//ancestor::label//following-sibling::div//input[@type='text']
${proj_trees_planted_add_another_btn}      xpath=//h3[contains(text(),'Trees Planted')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//button[contains(text(),'Add Another')]
${proj_trees_planted_text}      xpath=//span[contains(text(),'Trees Planted')]
${proj_trees_planted_textbox}      xpath=//span[contains(text(),'Trees Planted')]//ancestor::label//following-sibling::div//input[@type='text']
${proj_submit_btn}       xpath=//span[contains(text(),'Update')]
${projections_jobs_created}      xpath=//div[@class='panel h-auto']//div[@class='title'][contains(text(),'Jobs Created')]//following-sibling::div[@class='value'][contains(text(),'${tproj_jobs_created_textbox}')]
${projections_jobs_retained}      xpath=//div[@class='panel h-auto']//div[@class='title'][contains(text(),'Jobs Retained')]//following-sibling::div[@class='value'][contains(text(),'${tproj_jobs_retained_textbox}')]
${projections_trees_planted}      xpath=//div[@class='panel h-auto']//div[@class='title'][contains(text(),'Trees Planted')]//following-sibling::div[@class='value'][contains(text(),'${tproj_trees_planted_textbox}')]


#Parties
${parties}          xpath=//span[contains(text(),'${parties_title1}')]
#general_contractor
${prop_own_buss_name}        xpath=//h3[contains(text(),'Property Owner')]//parent::div//following-sibling::div//div[contains(text(),'Business Name')]//following-sibling::div
${prop_own_buss_ein}         xpath=//h3[contains(text(),'Property Owner')]//parent::div//following-sibling::div//div[contains(text(),'Business EIN')]//following-sibling::div
${prop_own_cont_name}        xpath=//h3[contains(text(),'Property Owner')]//parent::div//following-sibling::div//div[contains(text(),'Contact Name')]//following-sibling::div
${prop_own_addr}             xpath=//h3[contains(text(),'Property Owner')]//parent::div//following-sibling::div//div[contains(text(),'Address')]//following-sibling::div
${prop_own_phn_no}           xpath=//h3[contains(text(),'Property Owner')]//parent::div//following-sibling::div//div[contains(text(),'Phone Number')]//following-sibling::div

#Parties Edit Popup
${parties_edit_btn}     xpath=//button[contains(.,'Edit') and contains(.,'Parties')]
${party_edit_buss_name_input}        xpath=//span[contains(text(),'Business Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_buss_name_input}        xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Business Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_buss_ein_input}         xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'EIN:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_first_name_input}        xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'First Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_last_name_input}        xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Last Name:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_phn_no_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Phone Number:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_email_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Email:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_addr1_input}             xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Address 1:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_addr2_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Address 2:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_city_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'City:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_state_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'State:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_prop_own_zip_input}           xpath=//span[contains(text(),'Property Owner')]//following-sibling::div//label//span[contains(text(),'Zip:')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${party_edit_save_btn}              xpath=//div[@class='dx-overlay-content dx-popup-normal dx-resizable']//span[contains(text(),'Save')]

#Documentation Collection
${doc_coll}          xpath=//span[contains(text(),'${doc_coll_title}')]
${doc_coll_header}          xpath=//h3[@class='panel-heading'][contains(text(),'Applicant Documents')]
${doc_edit_bnt}          xpath=//button[@class='btn btn-primary'][contains(text(),'Edit Document Collection')]
${doc_edit_popup_del_doc_btn1}       xpath=//button[@class='btn btn-danger'][1]
${doc_coll_upload_btn}       xpath=//div[@class='dx-fileuploader-input-container']//input[@type='file']
${doc_coll_fileloc}      AutomationTesting\\civicserve\\test_data\\annual-enterprise-survey-2021-financial-year-provisional-size-bands-csv.csv
${doc_coll_upload_icon}     xpath=//i[@class='dx-icon dx-icon-upload']
${doc_coll_save_btn}     xpath=//div[@class='dx-button-content']//span[contains(text(),'Save')]
${appl_filename}        annual-enterprise-survey-2021-financial-year-provisional-size-bands-csv.csv
${doc_coll_file_ele}       xpath=//div[text()[contains(., '${tagreement_doc_name1}')]]

#Declarations
${declarations}          xpath=//span[contains(text(),'${declarations_title}')]
${app_ans_val}          xpath=//strong[contains(text(),'Applicant Answer')]//parent::div


#Declarations Edit Popup

${declarations_edit_btn}        xpath=//button[contains(.,'Edit') and contains(.,'Declarations')]
${popup_message}        xpath=//div[@class='alert alert-info']
${declarations_radio}           xpath=//div[@class='dx-item-content'][contains(text(),'Yes')]//preceding-sibling::div[@class='dx-radio-value-container']
#//div[@class='dx-item-content'][contains(text(),'Yes')]//preceding-sibling::div//div[@class='dx-radiobutton-icon']
${declarations_dd}           xpath=//span[contains(text(),'Relationship')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${declarations_option}           xpath=//div[contains(text(),'${tdeclarations_option}')]
${declarations_written_stmt}        xpath=//span[contains(text(),'Please provide a written statement')]//ancestor::label//following-sibling::div//textarea
${declarations_update_btn}        xpath=//span[contains(text(),'Update')]

#Agreement
${proj_header}          xpath=//h3[contains(text(),'${tproj_name}')]
${agreement_tab}          xpath=//span[contains(text(),'Compliance')]
#Obligations
${agreement_obligations_header}         xpath=//h3[contains(text(),'Agreement Obligations')]
${agreement_obligations_title_header}         xpath=//h3[contains(text(),'Agreement Obligations')]//ancestor::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[contains(text(),'Title')]
${agreement_title}         xpath=//div[contains(text(),'Title')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${agreement_responsible_party}         xpath=//div[contains(text(),'Responsible Party')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]
${agreement_compliance_status}         xpath=//div[contains(text(),'Compliance Status')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//span
${agreement_claw_back_provision}         xpath=//div[contains(text(),'Claw back Provision')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]//div
${agreement_frequency}          xpath=//div[contains(text(),'Agreement Frequency')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[5]
${agreement_obligations_add_btn}        xpath=//a[@class='btn btn-primary'][contains(text(),'Add')]
#add_agreement_obligation
${add_agreement_title_div_check}        xpath=//div[@class='dx-show-invalid-badge dx-textbox dx-texteditor dx-editor-outlined dx-widget dx-validator dx-visibility-change-handler']
${add_agreement_title}      xpath=//label//span[contains(text(),'Title')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_desc}       xpath=//label//span[contains(text(),'Description')]//ancestor::label//parent::div//following-sibling::div//textarea
${add_agreement_clawback_prov}      xpath=//div[@class='dx-switch-off']
${add_agreement_clawback_prov_val}      xpath=//div[@class='dx-switch-on'][contains(text(),'Yes')]
#|//div[@class='dx-switch-off'][contains(text(),'No')]
${add_agreement_header}      xpath=//div[contains(text(),'Add Project Agreement')]
${add_agreement_res_party_dd}      xpath=//label//span[contains(text(),'Responsible Party')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_res_party_option_val_check}      xpath=//div[@class='dx-dropdowneditor-overlay dx-overlay dx-popup dx-widget dx-visibility-change-handler dx-selectbox-popup']
${add_agreement_res_party_option}      xpath=//div[@class='dx-item-content dx-list-item-content'][contains(text(),'${tagreement_responsible_party}')]
#//span[contains(text(),'Responsible Party')]//ancestor::label//following-sibling::div//div[contains(text(),'${tagreement_responsible_party}')]
#//div[contains(text(),'${tagreement_responsible_party}')]
${add_agreement_obl_type_dd}      xpath=//label//span[contains(text(),'Obligation Type')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_obl_type_option}      xpath=//div[contains(text(),'${tagreement_obl}')]
${add_agreement_freq_type_dd}      xpath=//label//span[contains(text(),'Agreement Frequency Type')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_freq_type_option}      xpath=//div[contains(text(),'${tagreement_frequency}')]
${add_agreement_freq_type_dd_value}      xpath=//input[@name='agreementFrequencyType'][@value='${tagreement_frequency_value}']
${add_agreement_oblig_strt_dt}      xpath=//label//span[contains(text(),'Obligation Start Date')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_oblig_end_dt}      xpath=//label//span[contains(text(),'Obligation End Date')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_oblig_email_addr}      xpath=//label//span[contains(text(),'Email Addresses')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']        #click enter after entering the value
${add_agreement_end_dt}      xpath=//label//span[contains(text(),'Agreement End Date')]//ancestor::label//parent::div//following-sibling::div//input[@autocomplete='off']
${add_agreement_submit_btn}     xpath=//form//div[@role='form']//span[@class='dx-button-text'][contains(text(),'Submit')]
${add_agreement_cancel_btn}     xpath=//div[@class='dx-item dx-toolbar-item dx-toolbar-button']//span[contains(text(),'Submit')]//ancestor::div[@class='dx-item dx-toolbar-item dx-toolbar-button']//preceding-sibling::div[@class='dx-item dx-toolbar-item dx-toolbar-button']//span[contains(text(),'Cancel')]
${agreement_activate_btn}     xpath=//button[@title='Click to update status']
${agreement_sts_update_btn}     xpath=//span[contains(text(),'Update')]
#edit agreement obligation
${agreement_obligation_edit_btn}     xpath=//td[contains(text(),'${tadd_agreement_title}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='pen-to-square']
#Documents
${agreement_doc_header}         xpath=//h3[contains(text(),'Agreement Documents')]
${agreement_filename}       xpath=//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]//div
${agreement_type}       xpath=//div[contains(text(),'Agreement Type')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//div
${agreement_uploaded_dtm}       xpath=//div[contains(text(),'Date Uploaded')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]
${uploaded_btn_text}       xpath=//div[contains(text(),'Click or drag and drop')]
${upload_agrmt_doc}       xpath=//div[@class='dx-fileuploader-input-container']//input[@type='file']
#//div[@class='file-uploader-trigger']




#Delete agreement obligation
${agreement_obligation_del_btn}     xpath=//td[contains(text(),'${tedit_agreement_title}')]//following-sibling::td//div[@class='edit-delete-actions']//button//*[local-name()='svg' and @data-icon='trash']
${agrmt_obl_confirm_del_btn}     xpath=//span[contains(text(),'Delete')]

#edit agreement doc
${agrmt_doc_edit_btn}       xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel']//td//div[text()[contains(., '${tagreement_doc_name}')]]//parent::td//following-sibling::td//button[@class='btn btn-info'][2]
${agrmt_file_name}       xpath=//span[contains(text(),'File Name')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${agrmt_draft_type_dd}       xpath=//span[contains(text(),'Project Agreement Draft Type')]//ancestor::label//following-sibling::div//input[@autocomplete='off']
${agrmt_draft_type_option}       xpath=//div[contains(text(),'${tagrmt_type}')]
${agrmt_edit_popup_save_btn}        xpath=//span[contains(text(),'Save')]
${agrmt_edited_agrmt_type_txt}        xpath=//div[contains(text(),'ADOPTED')]
${agrmt_doc_view_btn}       xpath=//h3[contains(text(),'Agreement Documents')]//ancestor::div[@class='panel']//td//div[text()[contains(., '${tagreement_doc_name}')]]//parent::td//following-sibling::td//button[@class='btn btn-info'][1]

#Delete agreement document
${agreement_doc_del_btn}     xpath=//div[text()[contains(.,'${tagreement_doc_name1}')]]//parent::td//following-sibling::td//button[@class='btn btn-danger']
${agrmt_doc_confirm_del_btn}     xpath=//span[contains(text(),'Ok')]

#Files
${files_tab}          xpath=//span[contains(text(),'Files')]
${dwnld_file_btn}          xpath=//button[contains(text(),'Download Files')]
${dwnld_all_files_option}     xpath=//div[contains(text(),'All Files')]
${dwnld_applicant_files_only_option}      xpath=//div[contains(text(),'Applicant Files')]
${dwnld_staff_files_only_option}      xpath=//div[contains(text(),'Staff Files')]
${dwnld_third_party_files_only_option}      xpath=//div[contains(text(),'Third Party Files')]
${dwnld_system_files_only_option}      xpath=//div[contains(text(),'System')]
#Applicant
${applicant_files_filename_header}         xpath=//h3[contains(text(),'Applicant')]//parent::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//div[contains(text(),'File Name')]
${applicant_files_filename}         xpath=//h3[contains(text(),'Applicant')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${applicant_files_uploaded_dtm}         xpath=//h3[contains(text(),'Applicant')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Uploaded Date/Time')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]//span
${applicant_files_status}           xpath=//h3[contains(text(),'Applicant')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Status')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//span
${applicant_files_comments}     xpath=//h3[contains(text(),'Applicant')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Comments')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]
#Staff
${staf_files_filename_header}         xpath=//h3[contains(text(),'Staff')]//parent::div[@class='panel-inner']//following-sibling::div[@class='panel-body']//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//div[contains(text(),'File Name')]
${staff_files_filename}         xpath=//h3[contains(text(),'Staff')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${staff_files_uploaded_dtm}     xpath=//h3[contains(text(),'Staff')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Uploaded Date/Time')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]//span
${staff_files_status}       xpath=//h3[contains(text(),'Staff')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Status')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//span
${staff_files_comments}     xpath=//h3[contains(text(),'Staff')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Comments')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]
#third Party
${thirdparty_files_filename}         xpath=//h3[contains(text(),'Third Party')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${thirdparty_files_uploaded_dtm}     xpath=//h3[contains(text(),'Third Party')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Uploaded Date/Time')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]
${thirdparty_files_status}       xpath=//h3[contains(text(),'Third Party')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Status')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//span
${thirdparty_files_comments}     xpath=//h3[contains(text(),'Third Party')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Comments')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]
#system
${system_files_filename}         xpath=//h3[contains(text(),'System')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'File Name')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${system_files_uploaded_dtm}        xpath=//h3[contains(text(),'System')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Uploaded Date/Time')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]
${system_files_status}       xpath=//h3[contains(text(),'System')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Status')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//span
${system_files_comments}     xpath=//h3[contains(text(),'System')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Comments')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]

#upload file
#${upload_file_doc}       xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//div[@class='file-uploader-trigger']

#${file_doc_view_btn}       xpath=//h3//ancestor::div[@class='panel']//td//div[text()[contains(., '${tfile_tab_filename}')]]//parent::td//following-sibling::td//button[@class='btn btn-info'][1]
${file_doc_approve_btn}       xpath=//span[@class='dx-button-text'][text()[contains(., 'Approve')]]
${file_doc_reject_btn}       xpath=//span[@class='dx-button-text'][text()[contains(., 'Reject')]]
${file_confirm_popup_approve_btn}       xpath=//span[contains(text(),'Approve')]
${file_confirm_popup_cancel_btn}       xpath=//span[contains(text(),'Cancel')]
${file_confirm_popup_reject_reason_textbox}       xpath=//span[contains(text(),'Rejection Reason')]//ancestor::label//following-sibling::div//textarea
${file_confirm_popup_reject_btn}       xpath=//span[@class='dx-button-text'][contains(text(),'Reject')]

#Delete File
${file_doc_del_btn}     xpath=//div[text()[contains(.,'${tfile_doc_name1}')]]//parent::td//following-sibling::td//button[@class='btn btn-danger'][@title='Delete']
${file_doc_confirm_del_btn}     xpath=//span[contains(text(),'Ok')]

#Compliance
${compliance_tab}          xpath=//span[contains(text(),'Compliance')]
${agreement_compliance_header}      xpath=//h3[contains(text(),'Agreement Compliance')]
${compliance_agreement_mandate_title1}      xpath=(//div[@class='panel-body']//div[@class='title'][contains(text(),'Agreement Mandate Title')]//following-sibling::div[@class='value'])[1]
${compliance_agreement_desc1}        xpath=(//div[@class='panel-body']//div[@class='title'][contains(text(),'Description')]//following-sibling::div[@class='value'])[1]
${compliance_agreement_resp_party1}      xpath=(//div[@class='panel-body']//div[@class='title'][contains(text(),'Responsible Party')]//following-sibling::div[@class='value'])[1]
${compliance_status1}       xpath=(//div[@class='panel-body']//div[@class='title'][contains(text(),'CompStatus')]//following-sibling::div[@class='value'])[1]
${pastdue_agreement_title1}     xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Past Due')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[1])[1]
${pastdue_requested1}        xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Past Due')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[2])[1]
${pastdue_status1}      xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Past Due')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[3])[1]
${pastdue_duedate1}     xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Past Due')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[4])[1]
${upcoming_agreement_title1}        xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Upcoming')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[1])[1]
${upcoming_requested1}      xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Upcoming')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[2])[1]
${upcoming_status1}     xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Upcoming')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[3])[1]
${upcoming_duedate1}        xpath=(//div[@class='panel-classification-sub-heading'][contains(text(),'Upcoming')]//following-sibling::div[@class='data-grid-wrapper'][1]//div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//table[@class='dx-datagrid-table dx-datagrid-table-fixed']//tr[@class='dx-row dx-data-row dx-column-lines']//td[4])[1]

#Audit
${audit_tab}          xpath=//span[contains(text(),'Audit')]
${audit_tab_header}     xpath=//h3[@class='panel-heading'][contains(text(),'Audit')]
${audit_rows}       xpath=//tr[@class='dx-row dx-data-row dx-column-lines']
${audit_cols}       xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='1']//td
${no_of_default_items_per_page}       xpath=//div[@role='navigation']//div[@class='dx-page-sizes']//input[@type='hidden']
${noof_rows}        1
#${noof_cols}        1
${audit_dtm1}     xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${noof_rows}']//td[1]
${audit_desc1}      xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${noof_rows}']//td[2]
${audit_by1}        xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${noof_rows}']//td[3]
${temp_audit_curr_page}              xpath=//div[@class='dx-light-pages']//input[@type='hidden']
${temp_audit_page_cnt}              xpath=//div[@class='dx-pages-count']
${temp_audit_nxt_pg}              xpath=//div[@aria-label='Next Page']

#Correspondance
${correspondence_tab}          xpath=//span[contains(text(),'Correspondence')]
#Notes
${correspondence_notes_datetime_header}         xpath=//h3[contains(text(),'Notes')]//parent::div[@class='panel-inner']//following-sibling::div[@class='data-grid-wrapper']//div[@class='dx-datagrid-headers']//tbody//td//div[contains(text(),'Date Time')]
${correspondence_notes_datetime}         xpath=//div[contains(text(),'Date Time')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${correspondence_notes_note}         xpath=//h3[contains(text(),'Notes')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Note')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]//div
${correspondence_notes_projappr_status}           xpath=//h3[contains(text(),'Notes')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Project Approval Status')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]//span
${correspondence_notes_vis_to_app}     xpath=//h3[contains(text(),'Notes')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Visible To Applicant')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[4]//span
${correspondence_notes_by}          xpath=//h3[contains(text(),'Notes')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'By')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[5]//span
#Sent Messages
${correspondence_sentmessages_subject}          xpath=//h3[contains(text(),'Sent Messages')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Subject')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[1]
${correspondence_sentmessages_datetime}         xpath=//h3[contains(text(),'Sent Messages')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Date And Time')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[2]
${correspondence_sentmessages_recp_email}         xpath=//h3[contains(text(),'Sent Messages')]//parent::div[@class='panel-inner']//following-sibling::div//div[contains(text(),'Recepient')]//ancestor::div[@class='dx-datagrid-headers']//following-sibling::div[@class='dx-datagrid-rowsview dx-scrollable dx-visibility-change-handler dx-scrollable-both dx-scrollable-simulated']//tbody//tr[1]//td[3]
${add_msg_btn}     xpath=//button[contains(text(),'Add Message')]
#send message popup
${send_msg_popup_header}        xpath=//div[contains(text(),'Message Details')]
${selecttemp_dd_select_txt}        xpath=//div//input[@name='emailTemplateId']//parent::div//div[@data-dx_placeholder='Select...'][@class='dx-placeholder']
${selecttemp_sub_text}        xpath=//label//span[contains(text(),'Subject')]//ancestor::label//following-sibling::div//div[@class='dx-placeholder dx-state-invisible']
${selecttemp_dd}     xpath=//label//span[contains(text(),'Select Template')]//ancestor::label//following-sibling::div[@class='dx-field-item-content dx-field-item-content-location-right']//input[@autocomplete='off']
#//label//span[contains(text(),'Select Template')]//ancestor::label//following-sibling::div[@class='dx-field-item-content dx-field-item-content-location-right']//div[@data-dx_placeholder='Select...']
${selecttemp_option}     xpath=//div[contains(text(),'Attract and Retain- New Program Alert')]
${send_cust_email}      xpath=//button[contains(text(),'Send a Custom Email')]
${rec_email}        xpath=//label//span[contains(text(),'Recipient')]//ancestor::label//following-sibling::div[@class='dx-field-item-content dx-field-item-content-location-right']//input[@autocomplete='off']
${rec_email_sub}        xpath=//div[@class='dx-field-item-content dx-field-item-content-location-right']
#//input[@name='subject'][@autocomplete='off']
${sendto_mails_placeholder}        xpath=//div//input[@name='sendToEmails']//parent::div//div[@class='dx-placeholder']
${subject}      xpath=//label//span[contains(text(),'Subject')]//ancestor::label//following-sibling::div[@class='dx-field-item-content dx-field-item-content-location-right']//input[@autocomplete='off']
${corr_body}     xpath=//label//span[contains(text(),'Body')]//ancestor::label//following-sibling::div[@class='dx-field-item-content dx-field-item-content-location-right']//p
${attachment}       xpath=//div[@class='dx-fileuploader-input-container']//input[@type='file']
#//div[@class='file-uploader-trigger']
#//div[contains(text(),'Click or drag and drop files here')]

${uploadbtn}      xpath=//i[@class='dx-icon dx-icon-upload']
${uploaded_text}        xpath=//div[@class='dx-fileuploader-file-status-message'][contains(text(),'Uploaded')]
${uploaded_file_name_ele}        xpath=//div[@class='dx-fileuploader-file-name'][contains(text(),'')]
${send_msg_btn}     xpath=//span[contains(text(),'Send Message')]

#Delete Project
${del_proj_btn}     xpath=//p[text()[contains(., '${tproj_name}')]]//ancestor::td//parent::tr//button[@class='btn btn-danger'] | //td[text()[contains(., '${tproj_name}')]]//parent::tr//button[@class='btn btn-danger']
${confirm_del_proj_btn}     xpath=//span[contains(text(),'Delete')]
${deleted_success_msg}     xpath=//div[@role='alert'][contains(text(),'Record deleted successfully!')]
*** Keywords ***

Project: Admin adds a new Project
    [Documentation]    admin adds a new project
    [Arguments]     ${program_option}       ${tparcel_id}       ${dist_name}

    Find And Click Element      ${create_proj_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${create_proj_header}
    Wait Until Element Is Visible    ${create_proj_header}
    Wait Until Page Contains Element    ${down_proj_create_btn}
    Clear And Type Into Element    ${proj_desc}    ${tproj_desc}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${incentive_program_dd}
    Input Text for New Fields    ${incentive_program_dd}        ${program_option}
#    Wait Until Keyword Succeeds    1sec    10sec        Run Keyword And Ignore Error        Scroll Element Into View     xpath=//div[@role='option']//div[contains(text(),'${program_option}')]
#    Wait Until Element Is Visible    xpath=//div[@role='option']//span[contains(text(),'${program_option}')]     5
    Find And Click Element    xpath=//div[@role='option']//span[contains(text(),'${program_option}')]
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${proj_tier_dd}
    Find And Click Element    ${proj_tier_dd}
    Wait Until Page Contains Element    ${proj_tier_maj_cat_option}
    Find And Click Element    ${proj_tier_maj_cat_option}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${parcel_dd}
    Hover Mouse    ${parcel_dd}
    Input Text for New Fields    ${parcel_dd}       ${tparcel_id}
    Find And Click Element    //div[contains(text(),'${tparcel_id}')]
    Find And Click Element    ${district_dd}
    Find And Click Element    xpath=//div[contains(text(),'${dist_name}')]
    Find And Click Element    ${assign_bus_radio}
    Run Keyword And Ignore Error    Scroll Element Into View     ${assign_bus_radio}
    Wait Until Element Is Not Visible    ${loader_icon}     20
#    Wait Until Page Contains Element    ${sel_buss_dd}      30
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        1s      Scroll Element Into View     ${down_proj_create_btn}
    Hover Mouse    ${sel_buss_dd}
    Find And Click Element    ${sel_buss_dd}
    Run Keyword And Ignore Error    Scroll Element Into View     ${bus_option}
#    Hover Mouse    ${bus_option}
#    Find And Click Element    ${bus_option}
    Wait Until Element Is Not Visible    ${loader_icon}     20
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        1s      Scroll Element Into View     ${down_proj_create_btn}
#    Hover Mouse    ${sel_buss_dd}
    Find And Click Element    ${sel_buss_dd}
    Hover Mouse    ${bus_option}
    Find And Click Element    ${bus_option}
    Wait Until Element Is Not Visible    ${loader_icon}
    Wait Until Page Contains Element    ${assigned_user_dd}
    Hover Mouse    ${assigned_user_dd}
    Run Keyword and Ignore Error        Scroll Element Into View     ${assigned_user_dd}
    Find And Click Element    ${assigned_user_dd}
    Run Keyword and Ignore Error        Scroll Element Into View     ${assigned_user_option}
    Find And Click Element    ${assigned_user_option}
    Run Keyword And Ignore Error    Scroll Element Into View     ${down_proj_create_btn}
    Find And Click Element    ${down_proj_create_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible       ${added_success_msg}

Project: Admin Searches for a Project
    [Documentation]    admin searches for a project with pending submission status
    [Arguments]    ${tsearch_ip}
#    ${texist_proj_status}

    Wait Until Element Is Not Visible       ${loader_icon}      40
    Clear And Type Into Element    ${search_ip}    ${tsearch_ip}
#    Find And Click Element    ${filter_btn}
    Press Keys    ${search_ip}      ENTER

Project: Admin Searches for a Project and navigates to Project details
    [Documentation]    admin searches for a project with pending submission status and navigates to Project details
    [Arguments]    ${tsearch_ip}        ${tbuss}
#    ${texist_proj_status}

    Wait Until Element Is Not Visible       ${loader_icon}      60
    Wait Until Page Contains Element    ${no_loader_icon}      30
    Clear And Type Into Element    ${search_ip}    ${tsearch_ip}
    Press Keys    ${search_ip}      ENTER
#    Find And Click Element    ${filter_btn}
    Wait Until Element Is Not Visible       ${loader_icon}      60
    Run Keyword And Ignore Error        Scroll Element Into View     xpath=//p[text()[contains(., '${tsearch_ip}')]]//following-sibling::div[contains(text(),'${tproj_buss}')]//ancestor::td//following-sibling::td//a[@class='btn btn-info']
#    //p[text()[contains(., '${tsearch_ip}')]]//ancestor::td//following-sibling::td//span[contains(text(),'${texist_proj_status}')]//parent::td//following-sibling::td//a[@class='btn btn-info']
    Find And Click Element    xpath=//p[text()[contains(., '${tsearch_ip}')]]//following-sibling::div[contains(text(),'${tbuss}')]//ancestor::td//following-sibling::td//a[@class='btn btn-info']

Project: Admin approves a Project
    [Documentation]    admin approves a project

#    Wait Until Element Contains    ${approval_status_text}    ${tapproval_status_text}      20
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Page Contains Element    ${approval_status_edit}     20
    Wait Until Element Is Visible    ${approval_status_edit}     20
    Find And Click Element    ${approval_status_edit}
    Wait Until Page Does Not Contain Element    ${loader_icon}      60
    Wait Until Element Is Enabled    ${approval_status_select}
    Hover Mouse    ${approval_status_select}
    Wait Until Keyword Succeeds     1min        1sec        Find And Click Element    ${approval_status_select}
    Wait Until Element Is Visible    ${approval_status_approve_option}
    Hover Mouse    ${approval_status_approve_option}
    Find And Click Element    ${approval_status_approve_option}
    Clear And Type Into Element    ${date_project_opened}       ${tdate_project_opened}
    Clear And Type Into Element    ${estimated_closed_date}       ${testimated_closed_date}
    Clear And Type Into Element    ${max_approved_amt}       ${tmax_approved_amt}
    Find And Click Element    ${type_of_repaymt_dd}
    Find And Click Element    ${type_of_repaymt_option}
    Find And Click Element    ${approval_status_save_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible       ${added_success_msg}
    Reload Page
    Wait Until Element Is Visible    xpath=//div[@class='title'][contains(text(),'Approval Status')]//following-sibling::div[@class='value'][contains(text(),'${exp_active_text}')]       60

Project: Admin denies a Project
    [Documentation]    admin denies a project

    Wait Until Element Contains    ${approval_status_text}    ${tapproval_status_text}
    Find And Click Element    ${approval_status_edit}
    Wait Until Element Is Enabled    ${approval_status_select}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${approval_status_select}
    Wait Until Keyword Succeeds     1min        0.001sec        Find And Click Element    ${approval_status_select}
    Wait Until Element Is Visible    ${approval_status_denied_option}
    Find And Click Element    ${approval_status_denied_option}
    Clear And Type Into Element    ${date_project_denied}       ${tdate_project_denied}
    Clear And Type Into Element    ${denied_note}       ${tdenied_note}
    Find And Click Element    ${approval_status_save_btn}        validate_elementvisible=${added_success_msg}
    Wait Until Element Is Not Visible       ${added_success_msg}
    Wait Until Element Is Visible       xpath=//div[@class='title'][contains(text(),'Approval Status')]//following-sibling::div[@class='value'][contains(text(),'${exp_inactive_text}')]        20

Project: Admin closes a Project
    [Documentation]    admin closes a project

    Find And Click Element    ${approval_status_edit}
    Hover Mouse    ${approval_status_select}
    Find And Click Element    ${approval_status_select}
    Find And Click Element    ${approval_status_closed_option}
    Clear And Type Into Element    ${date_project_closed_out}       ${tdate_project_closed_out}
    Find And Click Element    ${approval_status_save_btn}


Project: Admin Reads Project Information
    [Documentation]    admin reads project information


    Wait Until Page Contains Element        xpath=//h3[contains(text(),'${tproj_name}')]        20
    Wait Until Page Contains Element    xpath=//div[@class='title'][contains(text(),'Program / District')]//following-sibling::div[contains(text(),'${tincentive_program}')]       20
#    Compare Actual Element text and expected text       ${applicant_name}        ${test_exp_applicant_name}   --getting actual text with applicant name text
    Compare Actual Element text and expected text       ${approval_status}        ${tapproval_status}
#    Compare Actual Element text and expected text       ${overall_impact_score}        ${toverall_impact_score}
    ${ttot_est_proj_cst_input_doll}=       TestData: Convert string to dollars   ${ttot_est_proj_cst_input}
#    Compare Actual Element text and expected text       ${total_estimate_project_cost}        ${ttot_est_proj_cst_input_doll}  -- no data due to financing details issue
    ${ttotal_eligible_costs}        Evaluate        ${tclearingOrgrading_elg_cost_input}+${tother_elg_cost_input}
    ${ttotal_eligible_costs_doll}=       TestData: Convert string to dollars   ${ttotal_eligible_costs}
    Compare Actual Element text and expected text       ${total_eligible_costs}        ${ttotal_eligible_costs_doll}
    ${treq_tot_fund_amt_input_doll}=       TestData: Convert string to dollars   ${treq_tot_fund_amt_input}
#    Compare Actual Element text and expected text       ${total_funding_requested}        ${treq_tot_fund_amt_input_doll}      -- no data due to financing details issue
    ${tmax_approved_amt_doll}=       TestData: Convert string to dollars   ${tmax_approved_amt}
    Compare Actual Element text and expected text       ${total_funding_offered}         ${tmax_approved_amt_doll}

Project: Admin Reads Application Project Information
    [Documentation]    admin reads application project information

    Wait Until Page Contains Element        xpath=//h3[contains(text(),'${tappl_proj_name}')]        20
    Wait Until Page Contains Element    xpath=//div[@class='title'][contains(text(),'Program / District')]//following-sibling::div[contains(text(),'${tappl_prog_name}')]       20
#    Compare Actual Element text and expected text       ${prog_or_dist_name}        ${tincentive_program1}
    Compare Actual Element text and expected text       ${applicant_name}        ${test_exp_applicant_name}
    Compare Actual Element text and expected text       ${approval_status}        ${tappl_proj_status}
    ${tappl_tot_est_proj_cst_input_doll}=       TestData: Convert string to dollars   ${tappl_tot_est_proj_cst_input}
    Compare Actual Element text and expected text       ${total_estimate_project_cost}        ${tappl_tot_est_proj_cst_input_doll}
    ${appl_elig_costs_sum}=  Evaluate    ${tappl_clearingOrgrading_elg_cost_input} + ${tappl_other_elg_cost_input}
    ${teligible_costs_total_doll}=       TestData: Convert string to dollars   ${appl_elig_costs_sum}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    ${ttotal_estimated_project_cost_doll}=       TestData: Convert string to dollars   ${ttot_est_proj_cst_input}
    ${appl_elig_costs_sum}=  Evaluate    ${tappl_clearingOrgrading_elg_cost_input} + ${tappl_other_elg_cost_input}
    ${teligible_costs_total_doll}=       TestData: Convert string to dollars   ${appl_elig_costs_sum}
    Compare Actual Element text and expected text       ${total_eligible_costs}        ${teligible_costs_total_doll}
    ${tappl_req_tot_fund_amt_input_doll}=       TestData: Convert string to dollars   ${tappl_req_tot_fund_amt_input}
    Compare Actual Element text and expected text       ${total_funding_requested}        ${tappl_req_tot_fund_amt_input_doll}

Project: Admin Reads Project Details
    [Documentation]    admin reads project details

    Wait Until Page Contains Element    xpath=//div[@class='title'][contains(text(),'Project Name')]//following-sibling::div[contains(text(),'${tproj_name}')]      60
    Compare Actual Element text and expected text       ${proj_det_proj_desc}        ${tproj_desc}
    Compare Actual Element text and expected text       ${proj_tier}        ${tproj_type}
#    Compare Actual Element text and expected text       ${proj_status}        ${tproj_status}

Project: Admin Reads Application Project Details
    [Documentation]    admin reads application project details


    Compare Actual Element text and expected text       ${proj_det_proj_name}         ${tappl_proj_name}
    Compare Actual Element text and expected text       ${proj_det_proj_desc}        ${tappl_proj_desc}
    Compare Actual Element text and expected text       ${proj_status}        ${tappl_proj_status}
    Compare Actual Element text and expected text       ${application_proj_tier}        ${tappl_proj_tier}

Project: Admin Reads property information
    [Documentation]    admin reads property information

    Wait Until Page Contains Element    ${prop_info}        30
    Wait Until Element Is Visible    xpath=//h3[contains(text(),'Proposed Changes')]        30
    Run Keyword And Ignore Error        Scroll Element Into View     ${prop_info}
    Find And Click Element    ${prop_info}
    Wait Until Page Contains Element    ${parcel_id}
    Run Keyword And Ignore Error        Scroll Element Into View     ${parcel_id}
    Compare Actual Element text and expected text       ${parcel_id}        ${tappl_parcel_id1}
#    Compare Actual Element text and expected text       ${parcel_id}        ${tedit_prop_info_parcel_id1}
    #Compare Actual Element text and expected text       ${parcel_addr}        ${tparcel_addr}
#    Compare Actual Element text and expected text       ${last_assessment}        ${tlast_assessment}
    #Compare Actual Element text and expected text       ${proposed_sqft}        ${tproposed_sqft}
    #Compare Actual Element text and expected text       ${proposed_use}        ${tproposed_use}
    #Compare Actual Element text and expected text       ${proposed_estd_fav}        ${tproposed_estd_fav}
    #Compare Actual Element text and expected text       ${max_cap}        ${tmax_cap}

Project: Admin Reads developer information
    [Documentation]    admin reads developer information

    Run Keyword And Ignore Error        Scroll Element Into View    ${dev_info}
    Find And Click Element    ${dev_info}
#    Wait Until Page Contains Element    ${dev_info_header}      10
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Compare Actual Element text and expected text       ${applicant_type}        ${tdev_info_popup_role_option}
    Compare Actual Element text and expected text       ${dev_info_applicant_name}        ${tdev_info_popup_ind_option}
    Run Keyword And Ignore Error        Scroll Element Into View     ${buss_name}
    Wait Until Element Contains    ${buss_name}    ${tproj_buss}
    Compare Actual Element text and expected text       ${buss_name}        ${tproj_buss}
#    Compare Actual Element text and expected text       ${phone}        ${tphone}
#    Compare Actual Element text and expected text       ${devemail}       ${tdev_email}
#    Compare Actual Element text and expected text       ${phy_addr}        ${tphy_addr}
#    Compare Actual Element text and expected text       ${mail_addr}        ${tmail_addr}
#    Compare Actual Element text and expected text       ${years_in_buss}        ${tyears_in_buss}
#    Compare Actual Element text and expected text       ${intention}        ${tintention}

Project: Admin Reads eligible costs
    [Documentation]    admin reads eligible costs

    Run Keyword And Ignore Error        Scroll Element Into View     ${elig_costs}
    Find And Click Element    ${elig_costs}
    Wait Until Page Contains Element    ${site_clearance_subtotal_value}        10
    ${tclearingOrgrading_elg_cost_input_doll}=       TestData: Convert string to dollars   ${tclearingOrgrading_elg_cost_input}
    Wait Until Element Contains    ${site_clearance_subtotal_value}        ${tclearingOrgrading_elg_cost_input_doll}
#    Run Keyword And Ignore Error        Scroll Element Into View     ${acquistion_subtotal_value}
#    Compare Actual Element text and expected text       ${acquistion_subtotal_value}        ${tacquistion_subtotal_value}
#    Compare Actual Element text and expected text       ${demolition_subtotal_value}        ${tdemolition_subtotal_value}
    Compare Actual Element text and expected text       ${site_clearance_subtotal_value}        ${tclearingOrgrading_elg_cost_input_doll}
#    Compare Actual Element text and expected text       ${soft_costs_subtotal_value}        ${tsoft_costs_subtotal_value}
    ${tother_elg_cost_input_doll}=       TestData: Convert string to dollars   ${tother_elg_cost_input}
    Compare Actual Element text and expected text       ${other_subtotal_value}        ${tother_elg_cost_input_doll}


Project: Admin Reads financing details
    [Documentation]    admin reads financing details

    Run Keyword And Ignore Error        Scroll Element Into View     ${fin_det}
    Find And Click Element    ${fin_det}
    Wait Until Page Contains Element    ${funding_request}      10
    Compare Actual Element text and expected text       ${funding_request}        ${tfunding_request}
    ${elig_costs_sum}=  Evaluate    ${tclearingOrgrading_elg_cost_input} + ${tother_elg_cost_input}
    ${teligible_costs_total_doll}=       TestData: Convert string to dollars   ${elig_costs_sum}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    ${ttotal_estimated_project_cost_doll}=       TestData: Convert string to dollars   ${ttot_est_proj_cst_input}
#    Wait Until Element Contains    ${total_estimated_project_cost}    ${ttotal_estimated_project_cost_doll}  --due to financing details issue
    Compare Actual Element text and expected text       ${eligible_costs_total}        ${teligible_costs_total_doll}
#    Compare Actual Element text and expected text       ${total_estimated_project_cost}        ${ttotal_estimated_project_cost_doll}
    ${ttotal_funding_amt_req_doll}=       TestData: Convert string to dollars   ${treq_tot_fund_amt_input}
#    Compare Actual Element text and expected text       ${total_funding_amt_req}        ${ttotal_funding_amt_req_doll}  --due to financing details issue

Project: Admin Reads estimated timeline
    [Documentation]    admin reads estimated timeline

    Run Keyword And Ignore Error        Scroll Element Into View     ${es_timeline}
    Find And Click Element    ${es_timeline}
    Wait Until Page Contains Element    ${es_strt_dt}       15
    Run Keyword And Ignore Error        Scroll Element Into View     ${es_strt_dt}
#    Compare Actual Element text and expected text       ${es_strt_dt}        ${tes_strt_dt}  --need to convert date
    Compare Actual Element text and expected text       ${es_title1}        ${tphase1_input}
    Compare Actual Element text and expected text       ${es_desc1}        ${tdescription1_input}

Project: Admin Reads projections
    [Documentation]    admin reads projections

    Run Keyword And Ignore Error        Scroll Element Into View    ${projections}
    Find And Click Element    ${projections}
    Wait Until Element Contains    xpath=//div[@class='panel h-auto']//div[@class='title'][contains(text(),'Jobs Created')]//following-sibling::div[@class='value']    ${tproj_jobs_created_textbox}      30
    Compare Actual Element text and expected text       ${projections_jobs_created}        ${tproj_jobs_created_textbox}
    Compare Actual Element text and expected text       ${projections_jobs_retained}        ${tproj_jobs_retained_textbox}
    Compare Actual Element text and expected text       ${projections_trees_planted}        ${tproj_trees_planted_textbox}

Project: Admin Reads parties
    [Documentation]    admin reads parties

    Run Keyword And Ignore Error        Scroll Element Into View    ${parties}
    Find And Click Element    ${parties}
    Compare Actual Element text and expected text       ${prop_own_buss_name}        ${tparty_edit_prop_own_buss_name_input}
    Compare Actual Element text and expected text       ${prop_own_buss_ein}        ${tparty_edit_prop_own_buss_ein_input}
    ${party_full_name} = 		Catenate    ${tparty_prop_own_first_name_input}     ${tparty_prop_own_last_name_input}
    Compare Actual Element text and expected text       ${prop_own_cont_name}        ${party_full_name}
    ${party_full_addr} = 		Catenate    ${tparty_prop_own_addr1_input}     ${tparty_prop_own_addr2_input}       ${tparty_prop_own_city_input}       ${tparty_prop_own_state_input}      ${tparty_prop_own_zip_input}
    Compare Actual Element text and expected text       ${prop_own_addr}        ${party_full_addr}
#    Compare Actual Element text and expected text       ${prop_own_phn_no}        ${tprop_own_phn_no}

Project: Admin Reads Document Colleciton
    [Documentation]    admin reads document collection

    Run Keyword And Ignore Error        Scroll Element Into View     ${doc_coll}
    Find And Click Element    ${doc_coll}
    Wait Until Page Contains Element    ${doc_coll_header}
    Wait Until Page Contains Element        ${doc_coll_file_ele}


Project: Admin Reads Declarations
    [Documentation]    admin reads declarations

    Run Keyword And Ignore Error        Scroll Element Into View     ${declarations}
    Find And Click Element    ${declarations}
    Wait Until Page Contains Element    ${app_ans_val}
    Element Should Contain    ${app_ans_val}    ${tapp_ans_val}

Project: Admin Reads Agreement
    [Documentation]    admin reads agreement

    Run Keyword And Ignore Error    Scroll Element Into View    ${proj_header}
    Run Keyword And Ignore Error    Scroll Element Into View    ${agreement_tab}
    Hover Mouse    ${agreement_tab}
    Find And Click Element    ${agreement_tab}
    Wait Until Page Contains Element    ${agreement_obligations_title_header}       15
    Compare Actual Element text and expected text       ${agreement_title}        ${tedit_agreement_title}
#    --issue with adding agreement obligation so cannot read
    Compare Actual Element text and expected text       ${agreement_responsible_party}        ${tagreement_responsible_party}
    Compare Actual Element text and expected text       ${agreement_compliance_status}        ${tedit_agreement_obl_status}
#    Compare Actual Element text and expected text       ${agreement_claw_back_provision}        ${tagreement_claw_back_provision}
    Compare Actual Element text and expected text       ${agreement_frequency}        ${tagreement_frequency}
    Run Keyword And Ignore Error        Scroll Element Into View     ${agreement_filename}
    Compare Actual Element text and expected text       ${agreement_filename}        ${tagreement_doc_name}
    Compare Actual Element text and expected text       ${agreement_type}        ${tagreement_type}
#    Compare Actual Element text and expected text       ${agreement_uploaded_dtm}        ${tagreement_uploaded_dtm}

Project: Admin Reads Files
    [Documentation]    admin reads files

    Run Keyword And Ignore Error    Scroll Element Into View    ${proj_header}
    Run Keyword And Ignore Error    Scroll Element Into View    ${files_tab}
    Hover Mouse    ${files_tab}
    Find And Click Element    ${files_tab}
#    Wait Until Page Contains Element    ${applicant_files_filename_header}       15
    Compare Actual Element text and expected text       ${applicant_files_filename}        ${appl_filename}
    Wait Until Page Contains Element    ${staf_files_filename_header}       15
    Run Keyword And Ignore Error    Scroll Element Into View    ${staff_files_filename}
    Compare Actual Element text and expected text       ${staff_files_filename}        ${tfile_doc_name}
    Compare Actual Element text and expected text       ${third_party_files_filename}        ${tfile_doc_name1}

Project: Admin Reads Compliance
    [Documentation]    admin reads Compliance

    Find And Click Element    ${compliance_tab}
    Wait Until Page Contains Element    ${agreement_compliance_header}       15
    Wait Until Element Contains    ${compliance_agreement_mandate_title1}    ${tcompliance_agreement_mandate_title1}        15
    Compare Actual Element text and expected text       ${compliance_agreement_mandate_title1}        ${tcompliance_agreement_mandate_title1}
    Compare Actual Element text and expected text       ${compliance_agreement_desc1}         ${tcompliance_agreement_desc1}
    Compare Actual Element text and expected text       ${compliance_agreement_resp_party1}        ${tcompliance_agreement_resp_party1}
    Compare Actual Element text and expected text       ${compliance_status1}        ${tcompliance_status1}

Project: Admin Reads Audit
    [Documentation]    admin reads Audit

    Find And Click Element    ${audit_tab}
    Wait Until Page Contains Element    ${audit_tab_header}       15
    Compare Actual Element text and expected text       ${audit_dtm1}        ${taudit_dtm1}
    Compare Actual Element text and expected text       ${audit_desc1}         ${taudit_desc1}
    Compare Actual Element text and expected text       ${audit_by1}        ${taudit_by1}

Project: Create Audit Data
    [Documentation]    creates audit data in tuples

    Wait Until Page Contains Element    ${audit_tab}       15
    Run Keyword And Ignore Error    Scroll Element Into View    ${audit_tab}
    Wait Until Page Contains Element    ${overview_det_header}       15
    Run Keyword And Ignore Error    Scroll Element Into View    ${overview_det_header}
    Find And Click Element    ${audit_tab}
    Wait Until Page Contains Element    ${audit_tab_header}       15
    Wait Until Keyword Succeeds    2min    5sec    Wait Until Page Contains Element    ${audit_dtm1}
    ${counter} =     Convert To Integer  1
    ${page_cnt} =   Get Text    ${temp_audit_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${curr_page_cnt} =  SeleniumLibrary.Get Element Attribute    ${temp_audit_curr_page}    value
    ${curr_page_cnt} =   Convert To Integer  ${curr_page_cnt}
    ${no_of_default_items_per_page_cnt} =  SeleniumLibrary.Get Element Attribute    ${no_of_default_items_per_page}    value
    @{audit_data}=  Create list
    ${page_check}=  Convert To Integer  1
    WHILE   ${curr_page_cnt} != ${page_cnt} or ${page_check} == 1
        ${noof_rows}        SeleniumLibrary.Get Element Count    ${audit_rows}
        ${int}      Evaluate    ${curr_page_cnt} * ${no_of_default_items_per_page_cnt}-${no_of_default_items_per_page_cnt}+1
        ${last}     Evaluate    (${curr_page_cnt}-1) * ${no_of_default_items_per_page_cnt}+${noof_rows}
        FOR    ${counter}    IN RANGE    ${int}     ${last}+1
            Wait Until Page Contains Element    xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${counter}']//td[1]     10
            ${dtm}=     Get Text       xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${counter}']//td[1]
            Wait Until Page Contains Element    xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${counter}']//td[2]     10
            ${desc}=        Get Text       xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${counter}']//td[2]
            Wait Until Page Contains Element    xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${counter}']//td[3]     10
            ${by}=      Get Text       xpath=//tr[@class='dx-row dx-data-row dx-column-lines'][@aria-rowindex='${counter}']//td[3]
            ${item}       Evaluate     ('${dtm}', '${desc}', '${by}')
            Append To List      ${audit_data}       ${item}
        END

        IF  ${curr_page_cnt} != ${page_cnt}
            Find And Click Element     ${temp_audit_nxt_pg}
            Wait Until Element Is Not Visible    ${loader_icon}     60
            ${page_cnt} =   Get Text    ${temp_audit_page_cnt}
            ${page_cnt} =   Convert To Integer  ${page_cnt}
            ${curr_page_cnt} =  SeleniumLibrary.Get Element Attribute    ${temp_audit_curr_page}    value
            ${curr_page_cnt} =   Convert To Integer  ${curr_page_cnt}
        ELSE
             ${page_check}=  Convert To Integer  0
        END
    END
    [Return]    @{audit_data}

Project: Admin Reads Correspondence
    [Documentation]    admin reads correspondence

    Find And Click Element    ${correspondence_tab}
    Wait Until Page Contains Element    ${correspondence_notes_datetime_header}       15
    Compare Actual Element text and expected text       ${correspondence_notes_datetime}        ${tcorrespondence_notes_datetime}
    Compare Actual Element text and expected text       ${correspondence_notes_note}        ${tcorrespondence_notes_note}
    Compare Actual Element text and expected text       ${correspondence_notes_projappr_status}        ${tcorrespondence_notes_projappr_status}
    Compare Actual Element text and expected text       ${correspondence_notes_vis_to_app}        ${tcorrespondence_notes_vis_to_app}
    Compare Actual Element text and expected text       ${correspondence_notes_by}        ${tcorrespondence_notes_by}
    Compare Actual Element text and expected text       ${correspondence_sentmessages_subject}        ${tcorrespondence_sentmessages_subject}
    Compare Actual Element text and expected text       ${correspondence_sentmessages_datetime}        ${tcorrespondence_sentmessages_datetime}
    Compare Actual Element text and expected text       ${correspondence_sentmessages_recp_email}        ${tcorrespondence_sentmessages_recp_email}

Project: Admin Edits Property Info
    [Documentation]    admin edits property info

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${prop_info}        20
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View     ${prop_info}
    Find And Click Element    ${prop_info}
    Wait Until Element Is Visible    ${prop_info_edit_btn}      20
    Run Keyword And Ignore Error    Scroll Element Into View    ${prop_info_edit_btn}
    Find And Click Element    ${prop_info_edit_btn}
    Wait Until Page Contains Element    ${prop_info_edit_parcel_textbox}     15
    Wait Until Element is Visible       ${prop_info_parcel_id}
    Hover Mouse    ${prop_info_edit_parcel_textbox}
#    Mouse Move      3       3
    Find And Click Element    ${prop_info_edit_parcel_textbox}
    Input Text    ${prop_info_edit_parcel_textbox}    ${tedit_prop_info_parcel_id1}
    Wait Until Page Contains Element    ${prop_info_edit_parcel_options}        15
    Find And Click Element    ${prop_info_edit_parcel_options}
#    Wait Until Keyword Succeeds    0.01sec    10sec    Javascript Scroll to Element     ${prop_info_popup_ok_btn}
    Find And Click Element    ${prop_info_popup_alert_info_text}
    Wait Until Page Contains Element    ${prop_info_popup_ok_btn}
    Find And Click Element    ${prop_info_popup_ok_btn}
#    validate_element_visible=${prop_info_new_added_parcel_id}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10

Project: Admin Edits developer information
    [Documentation]    admin edits developer information

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${dev_info}     30
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View     ${dev_info}
    Find And Click Element    ${dev_info}
    Wait Until Element Is Visible    ${dev_info_edit_btn}      20
    Find And Click Element    ${dev_info_edit_btn}
    #individual
    #Find And Click Element    ${dev_info_popup_ind_radio}
    #Hover Mouse    ${dev_info_popup_app_dd}
    #Find And Click Element    ${dev_info_popup_app_dd}
    #Find And Click Element    ${dev_info_popup_app_option}
    #Hover Mouse    ${dev_info_popup_realtionship_dd}
    #Find And Click Element    ${dev_info_popup_realtionship_dd}
    #Find And Click Element    ${dev_info_popup_relationship_option}
    #Find And Click Element    ${dev_info_popup_ok_btn}
    #business
    Wait Until Page Does Not Contain Element    ${loader_icon}     60
    Wait Until Page Contains Element    ${selected_buss_ele}        20
    Wait Until Page Does Not Contain Element    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
#    Wait Until Element Is Visible    ${dev_info_popup_buss_radio}
#    Find And Click Element    ${dev_info_popup_buss_radio}
#    Wait Until Page Contains Element    ${dev_info_popup_buss_dd}
#    Hover Mouse    ${dev_info_popup_buss_dd}
#    Find And Click Element    ${dev_info_popup_buss_dd}
#    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View    ${dev_info_popup_buss_option}
#    Find And Click Element    ${dev_info_popup_buss_dd}
#    Hover Mouse     ${dev_info_popup_buss_option}
#    Find And Click Element    ${dev_info_popup_buss_option}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View    ${dev_info_popup_role_dd}
    Wait Until Page Contains Element    ${dev_info_popup_assigned_user_dd}
    Hover Mouse    ${dev_info_popup_assigned_user_dd}
    Find And Click Element    ${dev_info_popup_assigned_user_dd}
    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View    ${dev_info_popup_assigned_user_option}
    Find And Click Element    ${dev_info_popup_assigned_user_option}
    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View    ${dev_info_popup_role_dd}
    Hover Mouse    ${dev_info_popup_role_dd}
    Find And Click Element    ${dev_info_popup_role_dd}
    Wait Until Keyword Succeeds    0.01sec    10sec    Scroll Element Into View     ${dev_info_popup_role_option}
    Find And Click Element    ${dev_info_popup_role_option}
#    Wait Until Keyword Succeeds    0.01sec    10sec    Scroll Element Into View     ${dev_info_popup_ok_btn}
    Find And Click Element    ${dev_info_popup_ok_btn}
#    Wait Until Element Is Visible    ${added_success_msg}       10
#    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${dev_info_popup_ok_btn}       120




Project: Admin Edits eligible costs
    [Documentation]    admin edits eligible costs

    Wait Until Page Does Not Contain Element    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${elig_costs}   30
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View     ${elig_costs}
    Find And Click Element    ${elig_costs}
    Wait Until Page Contains Element    ${elg_costs_edit_btn}      20
    Run Keyword And Ignore Error    Scroll Element Into View     ${elg_costs_edit_btn}
    Find And Click Element    ${elg_costs_edit_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${clearingOrgrading_elg_cost_input}
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec        Scroll Element Into View    ${clearingOrgrading_elg_cost_input}
    Clear And Type Into Element    ${clearingOrgrading_elg_cost_input}    ${tclearingOrgrading_elg_cost_input}
    Wait Until Keyword Succeeds     1min        1sec        Scroll Element Into View    ${other_elg_cost_input}
    Clear And Type Into Element    ${other_elg_cost_input}    ${tother_elg_cost_input}
    Find And Click Element    ${elg_cost_popup_ok_btn}
#          120      validate_elementvisible=${added_success_msg}
#    Wait Until Page Contains Element    ${added_success_msg}        10
#    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${elg_cost_popup_ok_btn}     20

Project: Admin Edits financing details
    [Documentation]    admin edits financing details

#    Reload Page
    Wait Until Page Does Not Contain Element    xpath=//div[contains(text(),'Loading')]     20
    Wait Until Page Does Not Contain Element    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${fin_det}      30
    Wait Until Element Is Visible    ${fin_det}      30
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View    ${fin_det}
    Find And Click Element    ${fin_det}
    Wait Until Element Is Visible    ${fin_det_fund_req_text}
#    Wait Until Element Is Visible    xpath=//h3[contains(text(),'Proposed Changes')]        30
    Wait Until Element Is Visible    ${fin_det_edit_btn}      20
    Hover Mouse    ${fin_det_edit_btn}
    Find And Click Element    ${fin_det_edit_btn}
    Wait Until Page Does Not Contain Element    ${loader_icon}      20
#    Wait Until Page Contains Element    ${req_fun_typ_dd}       30
#    Wait Until Keyword Succeeds    2min    5s    Wait Until Page Contains Element    ${est_elg_cost_totl_input}       60
#    Wait Until Keyword Succeeds    2min    5s    Wait Until Page Contains Element    ${req_fun_typ_ele}       60
#    Hover Mouse    ${req_fun_typ_dd}
#    Find And Click Element    ${req_fun_typ_dd}
#    Find And Click Element    ${req_fun_typ_option}
    Wait Until Keyword Succeeds    2min    5s    Wait Until Page Contains Element    ${est_elg_cost_totl_input}       60
    Wait Until Keyword Succeeds    2min    5s    Wait Until Page Contains Element    ${req_fun_typ_ele}       60
#    Wait Until Page Contains Element    ${req_fun_typ_ele}      30
    Wait Until Element Is Visible    ${tot_est_proj_cst_input}
    Input Text for New Fields   ${tot_est_proj_cst_input}    ${ttot_est_proj_cst_input}
    Input Text for New Fields    ${rec_tot_fund_amt_input}    ${treq_tot_fund_amt_input}
#    Clear And Type Into Element    ${req_upfrnt_fund_amt_input}    ${treq_upfrnt_fund_amt_input}
#    Clear And Type Into Element    ${req_pay_go_fund_amt_input}    ${treq_pay_go_fund_amt_input}
#    Clear And Type Into Element    ${fin_det_dev_equity_input}    ${tfin_det_dev_equity_input}
#    Run Keyword and Ignore Error    Javascript Scroll to Element    ${fin_det_const_loans_input}
#    Clear And Type Into Element    ${fin_det_const_loans_input}    ${tfin_det_const_loans_input}
#    Javascript Scroll to Element    ${fin_det_add_notes}
#    Clear And Type Into Element    ${fin_det_add_notes}     ${tfin_det_add_notes}
    Wait Until Page Contains Element    ${fin_det_ok_btn}       20
    Wait Until Element Is Visible    ${fin_det_ok_btn}      20
    Hover Mouse    ${fin_det_ok_btn}
    Find And Click Element    ${fin_det_ok_btn}
#    120     validate_elementvisible=${added_success_msg}
#    Wait Until Element Is Visible    ${added_success_msg}       10
#    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${fin_det_ok_btn}      30

Project: Admin Edits estimated timeline
    [Documentation]    admin edits estimated timeline

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${es_timeline}      15
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View    ${es_timeline}
    Find And Click Element    ${es_timeline}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    ${es_timeline_edit_btn}      20
    Find And Click Element    ${es_timeline_edit_btn}
    Wait Until Element Contains    ${popup_message}        ${testimated_timeline_alert_stmt}        30
    Find And Click Element    ${timeline_selection_dd}
    Find And Click Element    ${timeline_selection_option}
    Wait Until Page Contains Element    ${timeline_selection_dd_selectedtext}       30
    Wait Until Page Contains Element    ${timeline_add_phase_btn}      15
    Hover Mouse    ${timeline_add_phase_btn}
    Find And Click Element    ${timeline_add_phase_btn}
    Wait Until Element Is Enabled    ${phase1_input}
    Clear And Type Into Element    ${phase1_input}    ${tphase1_input}
    Clear And Type Into Element    ${date1_input}    ${tdate1_input}
    Clear And Type Into Element    ${description1_input}    ${tdescription1_input}

#    Wait Until Element Is Enabled    ${phase1_input}
#    Clear And Type Into Element    ${phase1_input}    ${tphase1_input}
#    Clear And Type Into Element    ${date1_input}    ${tdate1_input}
#    Clear And Type Into Element    ${description1_input}    ${tdescription1_input}
#    Run Keyword And Ignore Error     Wait Until Keyword Succeeds    0.01sec    10sec    Scroll Element Into View     ${responsible_party1_dd}
#    Hover Mouse    ${responsible_party1_dd}
#    Find And Click Element    ${responsible_party1_dd}
#    Hover Mouse    ${responsible_party1_option1}
#    Find And Click Element    ${responsible_party1_option1}
#    Run Keyword And Ignore Error        Scroll Element Into View     ${completion_status1_dd}
#    Hover Mouse    ${completion_status1_dd}
#    Find And Click Element    ${completion_status1_dd}
#    Run Keyword And Ignore Error        Scroll Element Into View     ${completion_status1_option1}
#    Hover Mouse    ${completion_status1_option1}
#    Find And Click Element    ${completion_status1_option1}
#    Run Keyword And Ignore Error        Scroll Element Into View     ${updated_datetime1_input}
#    Clear And Type Into Element    ${updated_datetime1_input}    ${tupdated_datetime1_input}
    Find And Click Element    ${es_timeline_submit_btn}
#          120     validate_elementvisible=${added_success_msg}
#    Wait Until Element Is Visible    ${added_success_msg}       10
#    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${es_timeline_submit_btn}

Project: Admin Edits projections
    [Documentation]    admin edits projections

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${projections}      30
    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        5secs       Scroll Element Into View    ${projections}
    Find And Click Element    ${projections}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Contains    xpath=//div[@class='panel-body']//div[@class='title'][contains(text(),'Jobs Created')]//following-sibling::div[@class='value']    ${tproj_jobs_created_text}      30
    Wait Until Element Is Visible    ${projections_edit_btn}      20
    Find And Click Element    ${projections_edit_btn}
#    Wait Until Element Is Visible    ${add_another_btn_ele}     30
#    Find And Click Element    ${proj_jobs_created_add_another_btn}
    Wait Until Element Is Visible    ${proj_jobs_created_textbox}
    Input Text for New Fields    ${proj_jobs_created_textbox}       ${tproj_jobs_created_textbox}
#    Find And Click Element    ${proj_jobs_retained_add_another_btn}
    Wait Until Element Is Visible    ${proj_jobs_retained_textbox}
    Input Text for New Fields    ${proj_jobs_retained_textbox}       ${tproj_jobs_retained_textbox}
#    Wait Until Keyword Succeeds    1min    0.001sec    Scroll Element Into View    ${proj_trees_planted_add_another_btn}
#    Find And Click Element    ${proj_trees_planted_add_another_btn}
#    Mouse Click    ${proj_trees_planted_text}
#    Run Keyword And Ignore Error    Scroll Element Into View     ${proj_trees_planted_add_another_btn}
#    Wait Until Keyword Succeeds    1min    0.001sec    Javascript Scroll to Element    ${proj_trees_planted_text}
#    Wait Until Keyword Succeeds    1min    0.001sec    Javascript Scroll to Element    ${proj_trees_planted_textbox}
    Run Keyword And Ignore Error    Scroll Element Into View     ${proj_trees_planted_textbox}
    Wait Until Element Is Visible    ${proj_trees_planted_textbox}
    Input Text for New Fields    ${proj_trees_planted_textbox}       ${tproj_trees_planted_textbox}
    Find And Click Element    ${proj_submit_btn}
#          120     validate_elementvisible=${added_success_msg}
#    Wait Until Element Is Visible    ${added_success_msg}       10
#    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${proj_submit_btn}

Project: Admin Edits parties
    [Documentation]    admin edits parties

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
#    Wait Until Page Contains Element    ${parties}      30
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View   ${parties}
    Find And Click Element    ${parties}
    Wait Until Element Is Visible    ${parties_edit_btn}      20
    Find And Click Element    ${parties_edit_btn}
    Wait Until Element Is Visible    ${party_edit_buss_name_input}      15
    Run Keyword and Ignore Error        Scroll Element Into View    ${party_edit_prop_own_buss_name_input}
    Clear And Type Into Element    ${party_edit_prop_own_buss_name_input}    ${tparty_edit_prop_own_buss_name_input}
    Clear And Type Into Element    ${party_edit_prop_own_buss_ein_input}    ${tparty_edit_prop_own_buss_ein_input}
    Run Keyword and Ignore Error        Scroll Element Into View    ${party_edit_prop_own_zip_input}
    Clear And Type Into Element    ${party_edit_prop_own_first_name_input}    ${tparty_edit_prop_own_first_name_input}
    Clear And Type Into Element    ${party_edit_prop_own_last_name_input}    ${tparty_edit_prop_own_last_name_input}
    Clear And Type Into Element    ${party_edit_prop_own_phn_no_input}    ${tparty_edit_prop_own_phn_no_input}
    Clear And Type Into Element    ${party_edit_prop_own_email_input}    ${tparty_edit_prop_own_email_input}
    Clear And Type Into Element    ${party_edit_prop_own_addr1_input}    ${tparty_edit_prop_own_addr1_input}
    Clear And Type Into Element    ${party_edit_prop_own_addr2_input}    ${tparty_edit_prop_own_addr2_input}
    Run Keyword and Ignore Error        Scroll Element Into View    ${party_edit_prop_own_city_input}
    Clear And Type Into Element    ${party_edit_prop_own_city_input}    ${tparty_edit_prop_own_city_input}
    Clear And Type Into Element    ${party_edit_prop_own_state_input}    ${tparty_edit_prop_own_state_input}
    Run Keyword and Ignore Error        Scroll Element Into View    ${party_edit_prop_own_zip_input}
    Clear And Type Into Element    ${party_edit_prop_own_zip_input}    ${tparty_edit_prop_own_zip_input}
    Find And Click Element    ${party_edit_save_btn}
#    120        validate_elementvisible=${added_success_msg}
#    Wait Until Element Is Visible    ${added_success_msg}       10
#    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${party_edit_save_btn}     20

Project: Admin Edits Documentation Collection
    [Documentation]    admin edits documentation collection

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
#    Wait Until Page Contains Element    ${doc_coll}     30
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        1sec    Scroll Element Into View    ${doc_coll}
    Find And Click Element    ${doc_coll}
    Wait Until Page Contains Element    ${doc_edit_bnt}      20
    Run Keyword And Ignore Error    Scroll Element Into View    ${doc_edit_bnt}
    Find And Click Element    ${doc_edit_bnt}
#    Wait Until Keyword Succeeds    0.01sec    10sec    Javascript Scroll to Element     ${doc_coll_upload_btn}
#    Hover Mouse    ${doc_coll_upload_btn}
#    Upload File from Desktop using Autoit        ${doc_coll_upload_btn}     ${doc_coll_fileloc}
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds      1min        2secs       Scroll Element Into View     ${uploaded_btn_text}
    Choose File From Desktop    ${doc_coll_upload_btn}     ${agrmt_fileloc1}
    Wait Until Page Contains Element    ${doc_coll_upload_icon}     20
    Run Keyword and Ignore Error        Scroll Element Into View    ${doc_coll_upload_icon}
    Find And Click Element    ${doc_coll_upload_icon}
    Run Keyword and Ignore Error        Scroll Element Into View    ${doc_coll_save_btn}
    Find And Click Element    ${doc_coll_save_btn}
    Wait Until Element Is Not Visible    ${doc_coll_save_btn}


Project: Admin Adds Agreement Obligation
    [Documentation]    admin adds agreement obligation

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${agreement_tab}
    Wait Until Page Contains Element    ${agreement_obligations_add_btn}       30
    Find And Click Element    ${agreement_obligations_add_btn}
    Input Text for New Fields       ${add_agreement_title}        ${tadd_agreement_title}
    Input Text for New Fields       ${add_agreement_desc}        ${tadd_agreement_desc}
    Hover Mouse    ${add_agreement_clawback_prov}
    Find And Click Element    ${add_agreement_clawback_prov}
    Wait Until Element Is Visible    ${add_agreement_clawback_prov_val}     10
    Wait Until Element Is Visible    ${add_agreement_res_party_dd}     10
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${add_agreement_res_party_dd}
    Find And Click Element    ${add_agreement_res_party_dd}
    ${Result}=  Run Keyword And Return Status    Element Should Be Visible   ${add_agreement_res_party_option}
    IF    ${Result} == True
        Wait Until Page Contains Element    ${add_agreement_res_party_option_val_check}
        Find And Click Element    ${add_agreement_res_party_option}
    ELSE
        Hover Mouse    ${add_agreement_res_party_dd}
        global_element_functions.Mouse Click    ${add_agreement_res_party_dd}
        Find And Click Element    ${add_agreement_res_party_dd}
        Wait Until Page Contains Element    ${add_agreement_res_party_option_val_check}
        Find And Click Element    ${add_agreement_res_party_option}
    END
    Run Keyword And Ignore Error    Scroll Element Into View    ${add_agreement_obl_type_dd}
    Hover Mouse    ${add_agreement_obl_type_dd}
    Find And Click Element    ${add_agreement_obl_type_dd}
    Find And Click Element    ${add_agreement_obl_type_option}
    Hover Mouse    ${add_agreement_freq_type_dd}
    Find And Click Element    ${add_agreement_freq_type_dd}
    Find And Click Element    ${add_agreement_freq_type_option}
    Wait Until Page Contains Element    ${add_agreement_freq_type_dd_value}
#    Run Keyword And Ignore Error    Scroll Element Into View     ${add_agreement_oblig_strt_dt}
#    Input Text for New Fields       ${add_agreement_oblig_strt_dt}        ${tadd_agreement_oblig_strt_dt}
#    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View     ${add_agreement_oblig_end_dt}
#    Input Text for New Fields       ${add_agreement_oblig_end_dt}        ${tadd_agreement_oblig_end_dt}
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_agreement_oblig_email_addr}
    Input Text for New Fields       ${add_agreement_oblig_email_addr}        ${tadd_agreement_oblig_email_addr}
    global_element_functions.Mouse Click    ${add_agreement_oblig_email_addr}
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_agreement_end_dt}
    Input Text for New Fields       ${add_agreement_end_dt}        ${tadd_agreement_end_dt}
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_agreement_submit_btn}
    Find And Click Element    ${add_agreement_submit_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${add_agreement_submit_btn}        20

Project: Admin activates added agreement obligation
    [Arguments]     ${tagreement_title}
    [Documentation]    admin activates agreement obligation
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    xpath=//tr//td[contains(text(),'${tagreement_title}')]//following-sibling::td//button[@title='Click to update status'][contains(text(),'Inactive')]
    Find And Click Element    xpath=//tr//td[contains(text(),'${tagreement_title}')]//following-sibling::td//button[@title='Click to update status'][contains(text(),'Inactive')]
    Wait Until Element Is Visible    ${agreement_sts_update_btn}        10
    Hover Mouse    ${agreement_sts_update_btn}
    Find And Click Element    ${agreement_sts_update_btn}
    Wait Until Element Is Visible    xpath=//tr//td[contains(text(),'${tagreement_title}')]//following-sibling::td//button[@title='Click to update status'][contains(text(),'Active')]      60


Project: Admin Edits Agreement Obligation
    [Documentation]    admin adds agreement obligation

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${agreement_tab}
    Wait Until Page Contains Element    ${agreement_obligation_edit_btn}       30
    Find And Click Element    ${agreement_obligation_edit_btn}
    Wait Until Page Contains Element    ${add_agreement_title_div_check}       15
    Clear And Type Into Element       ${add_agreement_title}        ${tedit_agreement_title}
    Clear And Type Into Element       ${add_agreement_desc}        ${tedit_agreement_desc}
#    Hover Mouse    ${add_agreement_clawback_prov}
#    Find And Click Element    ${add_agreement_clawback_prov}
    Hover Mouse    ${add_agreement_res_party_dd}
    Find And Click Element    ${add_agreement_res_party_dd}
#    Hover Mouse    ${add_agreement_res_party_option}
    Find And Click Element    ${add_agreement_res_party_option}
    Run Keyword And Ignore Error    Scroll Element Into View    ${add_agreement_freq_type_dd}
    Hover Mouse    ${add_agreement_freq_type_dd}
    Find And Click Element    ${add_agreement_freq_type_dd}
    Find And Click Element    ${add_agreement_freq_type_option}
    Wait Until Page Contains Element    ${add_agreement_freq_type_dd_value}
#    Run Keyword And Ignore Error    Scroll Element Into View          ${add_agreement_oblig_strt_dt}
#    Clear And Type Into Element       ${add_agreement_oblig_strt_dt}        ${tedit_agreement_oblig_strt_dt}
#    Run Keyword And Ignore Error    Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View     ${add_agreement_oblig_end_dt}
#    Clear And Type Into Element       ${add_agreement_oblig_end_dt}        ${tedit_agreement_oblig_end_dt}
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_agreement_oblig_email_addr}
    Clear And Type Into Element       ${add_agreement_oblig_email_addr}        ${tedit_agreement_oblig_email_addr}
    global_element_functions.Mouse Click    ${add_agreement_oblig_email_addr}
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_agreement_end_dt}
    Clear And Type Into Element       ${add_agreement_end_dt}        ${tedit_agreement_end_dt}
    Find And Click Element    ${add_agreement_submit_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${add_agreement_submit_btn}        20

Project: Admin Deletes Agreement Obligation
    [Documentation]    admin deletes agreement obligation

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${agreement_tab}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${agreement_obligation_del_btn}       15
    Find And Click Element    ${agreement_obligation_del_btn}
    Hover Mouse    ${agrmt_obl_confirm_del_btn}
    Find And Click Element    ${agrmt_obl_confirm_del_btn}

Project: Admin Navigates to Agreement Document

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Element Is Visible    ${proj_header}     20
    Run Keyword And Ignore Error    Scroll Element Into View    ${proj_header}
    Run Keyword And Ignore Error    Scroll Element Into View    ${agreement_tab}
    Find And Click Element    ${agreement_tab}
    Wait Until Element Is Not Visible    ${loader_icon}     60

Project: Admin Uploads Agreement Document
    [Documentation]    admin uploads agreement document
    [Arguments]     ${agrmt_fileloc}        ${tagreement_doc_name}

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
#    Wait Until Element Is Visible    ${proj_header}     20
#    Run Keyword And Ignore Error    Scroll Element Into View    ${proj_header}
#    Run Keyword And Ignore Error    Scroll Element Into View    ${agreement_tab}
#    Find And Click Element    ${agreement_tab}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${agreement_doc_header}       15
    Run Keyword And Ignore Error        Scroll Element Into View     ${agreement_doc_header}
    Wait Until Page Contains Element    ${uploaded_btn_text}        15
    Run Keyword And Ignore Error        Scroll Element Into View     ${uploaded_btn_text}
    Choose File From Desktop    ${upload_agrmt_doc}     ${agrmt_fileloc}
    Wait Until Page Contains Element    xpath=//div[@class='dx-fileuploader-file-name'][contains(text(),'${tagreement_doc_name}')]//ancestor::div[@class='dx-fileuploader-file']//preceding-sibling::div//i[@class='dx-icon dx-icon-upload']        30
    Wait Until Keyword Succeeds     1sec        60sec       Run Keyword And Ignore Error        Scroll Element Into View    xpath=//h3[contains(text(),'KPI Compliance')]
    Find And Click Element    xpath=//div[@class='dx-fileuploader-file-name'][contains(text(),'${tagreement_doc_name}')]//ancestor::div[@class='dx-fileuploader-file']//preceding-sibling::div//i[@class='dx-icon dx-icon-upload']
    Wait Until Page Contains Element    ${uploaded_text}        30
    Wait Until Page Contains Element    xpath=//div[@class='dx-fileuploader-file-name'][contains(text(),'${tagreement_doc_name}')]
#    Wait Until Element Is Not Visible    ${uploadbtn}
    Wait Until Element Is Not Visible    xpath=//div[@class='dx-progressbar-status']        30

Project: Admin Edits Agreement Document
    [Documentation]    admin edits agreement document

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Run Keyword And Ignore Error    Scroll Element Into View    ${agrmt_doc_edit_btn}
    Find And Click Element    ${agrmt_doc_edit_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Find And Click Element    ${agrmt_draft_type_dd}
    Find And Click Element    ${agrmt_draft_type_option}
    Find And Click Element    ${agrmt_edit_popup_save_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Element Is Visible    ${agrmt_edited_agrmt_type_txt}       60

Project: Admin Deletes Agreement Document
    [Documentation]    admin deletes agreement document

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${agreement_tab}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${agreement_doc_del_btn}       30
    Run Keyword And Ignore Error        Scroll Element Into View    ${agreement_doc_header}
    Find And Click Element    ${agreement_doc_del_btn}
    Hover Mouse    ${agrmt_doc_confirm_del_btn}
    Find And Click Element    ${agrmt_doc_confirm_del_btn}

Project: Admin Navigates to Files tab
    [Documentation]    admin navigates to file document

    Wait Until Keyword Succeeds      1sec        60secs       Run Keyword And Ignore Error        Scroll Element Into View     ${files_tab}
    Find And Click Element    ${files_tab}

Project: Admin Uploads File Document
    [Documentation]    admin uploads file document
    [Arguments]     ${tupload_file_type}        ${file_tab_fileloc}     ${tfile_doc_name}

    Wait Until Page Contains Element    ${applicant_files_filename_header}       60
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Run Keyword And Ignore Error        Scroll Element Into View     ${staf_files_filename_header}
    Run Keyword And Ignore Error        Scroll Element Into View     xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//div[text()[contains(., 'Click or drag and drop')]]
    Run Keyword And Ignore Error        Scroll Element Into View     xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//div[@class='file-uploader-trigger']
    Choose File From Desktop    xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//div[@class='dx-fileuploader-input-container']//input[@type='file']     ${file_tab_fileloc}
    Run Keyword And Ignore Error        Scroll Element Into View    xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//i[@class='dx-icon dx-icon-upload']
    Find And Click Element    xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//i[@class='dx-icon dx-icon-upload']
    Wait Until Element Is Visible    xpath=//h3[contains(text(),'${tupload_file_type}')]//ancestor::div[@class='panel']//div[text()[contains(., '${tfile_doc_name}')]]      20
    Wait Until Element Is Not Visible    xpath=//div[@class='dx-progressbar-status']        30


Project: Admin Approve Uploaded File Document
    [Documentation]    admin approves uploaded file document
    [Arguments]     ${tfile_tab_filename}
    
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${applicant_files_filename_header}       30
    Run Keyword And Ignore Error        Scroll Element Into View     xpath=//h3//ancestor::div[@class='panel']//td//div[text()[contains(., '${tfile_tab_filename}')]]//parent::td//following-sibling::td//button[@class='btn btn-info'][@title='Approve']
    Find And Click Element    xpath=//h3//ancestor::div[@class='panel']//td//div[text()[contains(., '${tfile_tab_filename}')]]//parent::td//following-sibling::td//button[@class='btn btn-info'][@title='Approve']
    Run Keyword And Ignore Error        Wait Until Keyword Succeeds     1min        2secs       Scroll Element Into View     ${file_doc_approve_btn}
    Hover Mouse    ${file_doc_approve_btn}
    Find And Click Element    ${file_doc_approve_btn}
    Wait Until Element Is Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${added_success_msg}      10

Project: Admin Reject Uploaded File Document
    [Documentation]    admin rejects uploaded file document
    [Arguments]     ${tfile_tab_filename}

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    ${applicant_files_filename_header}       15
    Run Keyword And Ignore Error        Scroll Element Into View     xpath=//h3//ancestor::div[@class='panel']//td//div[text()[contains(., '${tfile_tab_filename}')]]//parent::td//following-sibling::td//button[@class='btn btn-danger'][@title='Reject']
    Find And Click Element    xpath=//h3//ancestor::div[@class='panel']//td//div[text()[contains(., '${tfile_tab_filename}')]]//parent::td//following-sibling::td//button[@class='btn btn-danger'][@title='Reject']
#    Run Keyword And Ignore Error        Scroll Element Into View     ${file_doc_reject_btn}
#    Wait Until Page Contains Element    ${file_doc_reject_btn}       15
#    Hover Mouse    ${file_doc_reject_btn}
#    Find And Click Element    ${file_doc_reject_btn}
    Clear And Type Into Element    ${file_confirm_popup_reject_reason_textbox}    ${trejectreason}
    Find And Click Element    ${file_confirm_popup_reject_btn}
    Find And Click Element    ${file_confirm_popup_reject_btn}
#    Wait Until Element Is Visible    ${added_success_msg}       10
#    Wait Until Element Is Not Visible    ${added_success_msg}      10
    Wait Until Element Is Not Visible    ${file_confirm_popup_reject_btn}       60

Project: Admin Downloads File Document
    [Documentation]    admin downloads all files document

    Run Keyword And Ignore Error        Scroll Element Into View     ${files_tab}
    Find And Click Element    ${files_tab}
    Find And Click Element    ${dwnld_file_btn}
    Find And Click Element    ${dwnld_all_files_option}


Project: Admin Deletes File Document
    [Documentation]    admin deletes agreement document

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${files_tab}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${file_doc_del_btn}       15
    Wait Until Page Contains Element    ${applicant_files_filename_header}      30
    Run Keyword And Ignore Error    Scroll Element Into View    ${applicant_files_filename_header}
    Run Keyword And Ignore Error    Scroll Element Into View    ${file_doc_del_btn}
    Find And Click Element    ${file_doc_del_btn}
    Hover Mouse    ${file_doc_confirm_del_btn}
    Find And Click Element    ${file_doc_confirm_del_btn}

Project: Admin sends message from correspondence tab
    [Documentation]    admin send message from correspondence

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Hover Mouse     ${correspondence_tab}
    Find And Click Element    ${correspondence_tab}
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_msg_btn}
    Find And Click Element    ${add_msg_btn}
    Wait Until Page Contains Element    ${send_msg_popup_header}       15
    Wait Until Page Contains Element    ${send_cust_email}       15
    Wait Until Element Is Visible    ${selecttemp_dd}       15
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Hover Mouse    ${selecttemp_dd}
    Find And Click Element    ${selecttemp_dd}
    Find And Click Element    ${selecttemp_option}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Does Not Contain Element    ${selecttemp_dd_select_txt}        20
    Wait Until Page Contains Element          ${selecttemp_sub_text}      20
    Input Text for New Fields       ${rec_email}      ${trec_email}
    Find And Click Element    ${rec_email_sub}
    Wait Until Page Does Not Contain Element    ${sendto_mails_placeholder}        20
    Wait Until Page Contains Element    ${attachment}       20
    Run Keyword And Ignore Error    Scroll Element Into View     ${attachment}
    Choose File From Desktop        ${attachment}     ${fileloc}
    Wait Until Page Contains Element    ${uploaded_text}
    Run Keyword And Ignore Error    Scroll Element Into View    ${uploaded_text}
    Wait Until Page Contains Element    xpath=//div[@class='dx-fileuploader-file-name'][contains(text(),'${tagreement_doc_name}')]
    Wait Until Page Contains Element    ${send_msg_btn}
    Run Keyword And Ignore Error    Scroll Element Into View    ${send_msg_btn}
    Find And Click Element    ${send_msg_btn}
    Wait Until Element Is Visible    ${added_success_msg}       30
    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${loader_icon}     60

Project: Admin sends custom email from correspondence tab
    [Documentation]    admin sends custom mail from correspondence

    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Find And Click Element    ${correspondence_tab}
    Wait Until Page Contains Element    ${add_msg_btn}       30
    Run Keyword And Ignore Error    Scroll Element Into View     ${add_msg_btn}
    Find And Click Element    ${add_msg_btn}
    Wait Until Page Contains Element    ${send_msg_popup_header}       15
    Hover Mouse    ${send_cust_email}
    Find And Click Element    ${send_cust_email}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Clear And Type Into Element       ${rec_email}      ${trec_email}
    Clear And Type Into Element       ${subject}      ${tsubject}
    Run Keyword And Ignore Error    Scroll Element Into View     ${corr_body}
    Clear And Type Into Element       ${corr_body}      ${tcorr_body}
    Run Keyword And Ignore Error    Scroll Element Into View     ${attachment}
    Choose File From Desktop        ${attachment}     ${fileloc1}
    Wait Until Page Contains Element    ${uploaded_text}
    Run Keyword And Ignore Error    Scroll Element Into View    ${uploaded_text}
    Wait Until Page Contains Element    xpath=//div[@class='dx-fileuploader-file-name'][contains(text(),'${tagreement_doc_name2}')]
    Wait Until Page Contains Element    ${send_msg_btn}
    Wait Until Element Is Visible    ${send_msg_btn}
    Run Keyword And Ignore Error    Scroll Element Into View     ${send_msg_btn}
    Find And Click Element    ${send_msg_btn}
    Wait Until Element Is Visible    ${added_success_msg}       30
    Wait Until Element Is Not Visible    ${added_success_msg}       10
    Wait Until Element Is Not Visible    ${loader_icon}     60


Project: Delete a Project
    [Documentation]    admin deletes a project
    [Arguments]    ${tproj_name}        ${tproj_buss}

#    Wait Until Element Is Not Visible    ${loader_icon}     15
#    Clear And Type Into Element    ${search_ip}    ${tproj_name}
#    Find And Click Element    ${filter_btn}
    Wait Until Element Is Not Visible    ${loader_icon}     60
    Wait Until Page Contains Element    ${no_loader_icon}   60
    Wait Until Page Contains Element    xpath=//p[text()[contains(., '${tproj_name}')]]//following-sibling::div[contains(text(),'${tproj_buss}')]//ancestor::td//parent::tr//button[@class='btn btn-danger']
    Run Keyword And Ignore Error    Scroll Element Into View    xpath=//p[text()[contains(., '${tproj_name}')]]//following-sibling::div[contains(text(),'${tproj_buss}')]//ancestor::td//parent::tr//button[@class='btn btn-danger']
    Find And Click Element    xpath=//p[text()[contains(., '${tproj_name}')]]//following-sibling::div[contains(text(),'${tproj_buss}')]//ancestor::td//parent::tr//button[@class='btn btn-danger']
    Hover Mouse    ${confirm_del_proj_btn}
    Find And Click Element    ${confirm_del_proj_btn}
#    validate_elementvisible=${deleted_success_msg}
    Wait Until Element Is Visible    ${deleted_success_msg}     30
    Wait Until Element Is Not Visible       ${deleted_success_msg}

Project: Go through the pages for specific project
    [Documentation]    Admin goes through the pages for a specific project.
    [Arguments]     ${proj_name}

    ${page_cnt} =   Get Text    ${proj_page_cnt}
    ${page_cnt} =   Convert To Integer  ${page_cnt}
    ${Result} =     Run Keyword And Return Status    Element Should Be Visible   xpath=//td[contains(text(),'${proj_name}')][1]
        WHILE   ${page_cnt} != 1 and ${Result} != 'True'
            Find And Click Element     ${proj_nxt_pg}
            ${page_cnt} =   Set Variable    ${page_cnt-1}
            ${Result}=  Run Keyword And Return Status    Element Should Be Visible   xpath=//td[contains(text(),'${proj_name}')][1]
        END

Project: Create Name

    ${test_proj_name}=     TestData: Create Project Name       ${tproj_name}
    Log To Console    ${test_proj_name}









