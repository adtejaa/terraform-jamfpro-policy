variable "name" {
  description = "The name of the policy"
  type        = string
}

variable "enabled" {
  description = "Define whether the policy is enabled"
  type        = bool
}

# Triggers
variable "trigger_checkin" {
  description = "Trigger policy when device performs recurring check-in"
  type        = bool
  default     = false
}

variable "trigger_enrollment_complete" {
  description = "Trigger policy when device enrollment is complete"
  type        = bool
  default     = false
}

variable "trigger_login" {
  description = "Trigger policy when a user logs in to a computer"
  type        = bool
  default     = false
}

variable "trigger_network_state_changed" {
  description = "Trigger policy when network state changes"
  type        = bool
  default     = false
}

variable "trigger_startup" {
  description = "Trigger policy when a computer starts up"
  type        = bool
  default     = false
}

variable "trigger_other" {
  description = "Any other trigger for the policy"
  type        = string
  default     = "EVENT"
}

# Execution
variable "frequency" {
  description = "Frequency of policy execution"
  type        = string
  default     = "Once per computer"
}

variable "retry_event" {
  description = "Event on which to retry policy execution"
  type        = string
  default     = "none"
}

variable "retry_attempts" {
  description = "Number of retry attempts (valid: -1 or 1-10)"
  type        = number
  default     = -1
}

variable "notify_on_each_failed_retry" {
  description = "Send notifications for each failed policy retry attempt"
  type        = bool
  default     = false
}

variable "target_drive" {
  description = "The drive on which to run the policy"
  type        = string
  default     = "/"
}

variable "offline" {
  description = "Make policy available offline"
  type        = bool
  default     = false
}

variable "category_id" {
  description = "Jamf Pro category ID for the policy"
  type        = number
  default     = -1
}

variable "site_id" {
  description = "Jamf Pro site ID for the policy"
  type        = number
  default     = -1
}

# Optional misc
variable "network_requirements" {
  description = "Network requirements for the policy (Any or Ethernet). Leave empty to skip."
  type        = string
  default     = ""
}

variable "package_distribution_point" {
  description = "Repository from which packages are collected"
  type        = string
  default     = ""
}

# Scope
variable "all_computers" {
  description = "Scope to all computers"
  type        = bool
  default     = false
}

variable "all_jss_users" {
  description = "Scope to all JSS users"
  type        = bool
  default     = false
}

variable "computer_ids" {
  description = "List of computer IDs to scope"
  type        = list(number)
  default     = []
}

variable "computer_group_ids" {
  description = "List of computer group IDs to scope"
  type        = list(number)
  default     = []
}

variable "building_ids" {
  description = "List of building IDs to scope"
  type        = list(number)
  default     = []
}

variable "department_ids" {
  description = "List of department IDs to scope"
  type        = list(number)
  default     = []
}

variable "jss_user_ids" {
  description = "List of JSS user IDs to scope"
  type        = list(number)
  default     = []
}

variable "jss_user_group_ids" {
  description = "List of JSS user group IDs to scope"
  type        = list(number)
  default     = []
}

# Payloads - Packages
variable "payloads_packages_distribution_point" {
  description = "Distribution point for packages"
  type        = string
  default     = "default"
}

variable "payloads_packages" {
  description = "List of package IDs"
  type        = list(number)
  default     = []
}

variable "payloads_packages_actions" {
  description = "List of actions for packages (Install, Cache, etc.)"
  type        = list(string)
  default     = []
}

variable "payloads_packages_fill_user_template" {
  description = "Fill user template for packages"
  type        = bool
  default     = false
}

variable "payloads_packages_fill_existing_user_template" {
  description = "Fill existing user template for packages"
  type        = bool
  default     = false
}

# Payloads - Scripts (supports multiple)
variable "payloads_scripts_ids" {
  description = "List of script IDs"
  type        = list(string)
  default     = []
}

variable "payloads_scripts_priorities" {
  description = "List of priorities for scripts (Before/After)"
  type        = list(string)
  default     = []
}

variable "payloads_scripts_parameter4" {
  description = "Script parameter 4 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter5" {
  description = "Script parameter 5 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter6" {
  description = "Script parameter 6 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter7" {
  description = "Script parameter 7 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter8" {
  description = "Script parameter 8 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter9" {
  description = "Script parameter 9 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter10" {
  description = "Script parameter 10 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

variable "payloads_scripts_parameter11" {
  description = "Script parameter 11 - can be string or list of strings (one per script)"
  type        = any
  default     = ""
}

# Disk Encryption
variable "payloads_disk_encryption_action" {
  description = "Disk encryption action (apply/remediate)"
  type        = string
  default     = ""
}

variable "payloads_disk_encryption_configuration_id" {
  description = "Disk encryption configuration ID"
  type        = number
  default     = 0
}

variable "payloads_disk_encryption_remediate_configuration_id" {
  description = "Remediate disk encryption configuration ID"
  type        = number
  default     = 0
}

variable "payloads_disk_encryption_remediate_key_type" {
  description = "Remediate key type"
  type        = string
  default     = "Individual"
}

variable "payloads_disk_encryption_auth_restart" {
  description = "Allow authenticated restart"
  type        = bool
  default     = false
}

# Printers
variable "payloads_printers_id" {
  description = "Printer ID"
  type        = number
  default     = 0
}

variable "payloads_printers_name" {
  description = "Printer name"
  type        = string
  default     = ""
}

variable "payloads_printers_action" {
  description = "Printer action (install, uninstall)"
  type        = string
  default     = "install"
}

variable "payloads_printers_make_default" {
  description = "Set printer as default"
  type        = bool
  default     = false
}

# Reboot (single version)
variable "payloads_reboot_message" {
  description = "Message displayed to user during reboot"
  type        = string
  default     = ""
}

variable "payloads_reboot_specify_startup" {
  description = "Reboot method"
  type        = string
  default     = "Standard Restart"
}

variable "payloads_reboot_startup_disk" {
  description = "Disk to boot to"
  type        = string
  default     = "Current Startup Disk"
}

variable "payloads_reboot_no_user_logged_in" {
  description = "Action if no user logged in"
  type        = string
  default     = "Do not restart"
}

variable "payloads_reboot_user_logged_in" {
  description = "Action if user logged in"
  type        = string
  default     = "Do not restart"
}

variable "payloads_reboot_minutes_until_reboot" {
  description = "Minutes until reboot"
  type        = number
  default     = 5
}

variable "payloads_reboot_start_timer_immediately" {
  description = "Start reboot timer immediately"
  type        = bool
  default     = false
}

variable "payloads_reboot_file_vault_2_reboot" {
  description = "Authenticated restart for FileVault 2"
  type        = bool
  default     = false
}

# Maintenance (single version)
variable "payloads_maintenance_recon" {
  description = "Run recon (inventory update)"
  type        = bool
  default     = false
}

variable "payloads_maintenance_reset_name" {
  description = "Reset computer name"
  type        = bool
  default     = false
}

variable "payloads_maintenance_install_all_cached_packages" {
  description = "Install all cached packages"
  type        = bool
  default     = false
}

variable "payloads_maintenance_heal" {
  type    = bool
  default = false
}

variable "payloads_maintenance_prebindings" {
  type    = bool
  default = false
}

variable "payloads_maintenance_permissions" {
  type    = bool
  default = false
}

variable "payloads_maintenance_byhost" {
  type    = bool
  default = false
}

variable "payloads_maintenance_system_cache" {
  type    = bool
  default = false
}

variable "payloads_maintenance_user_cache" {
  type    = bool
  default = false
}

variable "payloads_maintenance_verify" {
  type    = bool
  default = false
}
# Self Service (single display_name/description)
variable "self_service_use_for_self_service" {
  description = "Enable self-service for policy"
  type        = bool
  default     = false
}

variable "self_service_display_name" {
  description = "Display name of the policy in self-service"
  type        = string
  default     = ""
}

variable "self_service_description" {
  description = "Description of the policy displayed in self-service"
  type        = string
  default     = ""
}

variable "self_service_install_button_text" {
  description = "Self-service install button text"
  type        = string
  default     = "Install"
}

variable "self_service_reinstall_button_text" {
  description = "Self-service reinstall button text"
  type        = string
  default     = "Reinstall"
}

variable "self_service_icon_file_path" {
  description = "Self-service icon file path (local path like ./icon/FF.png) - module will upload automatically"
  type        = string
  default     = null
}

variable "self_service_category_id" {
  type    = number
  default = null
}

variable "self_service_category_display_in" {
  type    = bool
  default = true
}

variable "self_service_category_feature_in" {
  type    = bool
  default = false
}

variable "self_service_force_users_to_view_description" {
  type    = bool
  default = false
}

variable "self_service_feature_on_main_page" {
  type    = bool
  default = false
}

variable "self_service_notification" {
  type    = bool
  default = false
}

variable "self_service_notification_type" {
  type    = string
  default = "Self Service"
}

variable "self_service_notification_subject" {
  type    = string
  default = ""
}

variable "self_service_notification_message" {
  type    = string
  default = ""
}

# Date/Time Limitations
variable "date_time_activation_date" {
  type    = string
  default = null
}

variable "date_time_expiration_date" {
  type    = string
  default = null
}

variable "date_time_no_execute_on" {
  type    = list(string)
  default = []
}

variable "date_time_no_execute_start" {
  type    = string
  default = null
}

variable "date_time_no_execute_end" {
  type    = string
  default = null
}

# Network Limitations
variable "network_limitations_minimum_network_connection" {
  type    = string
  default = "No Minimum"
}

variable "network_limitations_any_ip_address" {
  type    = bool
  default = true
}

# Scope Limitations
variable "scope_limitations_network_segment_ids" {
  type    = list(number)
  default = []
}

variable "scope_limitations_ibeacon_ids" {
  type    = list(number)
  default = []
}

variable "scope_limitations_directory_usernames" {
  type    = list(string)
  default = []
}

variable "scope_limitations_directory_user_groups" {
  type    = list(string)
  default = []
}

# Scope Exclusions
variable "scope_exclusions_computer_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_computer_group_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_building_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_department_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_network_segment_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_jss_user_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_jss_user_group_ids" {
  type    = list(number)
  default = []
}

variable "scope_exclusions_directory_usernames" {
  type    = list(string)
  default = []
}

variable "scope_exclusions_directory_user_groups" {
  type    = list(string)
  default = []
}

variable "scope_exclusions_ibeacon_ids" {
  type    = list(number)
  default = []
}

# Dock Items
variable "payloads_dock_items_ids" {
  type    = list(number)
  default = []
}

variable "payloads_dock_items_names" {
  type    = list(string)
  default = []
}

variable "payloads_dock_items_actions" {
  type    = list(string)
  default = []
}

# Account Maintenance
variable "payloads_account_maintenance_local_accounts" {
  type    = bool
  default = false
}

variable "payloads_account_maintenance_username" {
  type    = string
  default = ""
}

variable "payloads_account_maintenance_action" {
  type    = string
  default = "Create"
}

# Files and Processes
variable "payloads_files_processes_search_by_path" {
  type    = string
  default = ""
}

variable "payloads_files_processes_delete_file" {
  type    = bool
  default = false
}

variable "payloads_files_processes_locate_file" {
  type    = string
  default = ""
}

variable "payloads_files_processes_update_locate_database" {
  type    = bool
  default = false
}

variable "payloads_files_processes_spotlight_search" {
  type    = string
  default = ""
}

variable "payloads_files_processes_search_for_process" {
  type    = string
  default = ""
}

variable "payloads_files_processes_kill_process" {
  type    = bool
  default = false
}

variable "payloads_files_processes_run_command" {
  type    = string
  default = ""
}

# User Interaction
variable "payloads_user_interaction_message_start" {
  type    = string
  default = ""
}

variable "payloads_user_interaction_allow_users_to_defer" {
  type    = bool
  default = false
}

variable "payloads_user_interaction_allow_deferral_until_utc" {
  type    = string
  default = null
}

variable "payloads_user_interaction_allow_deferral_minutes" {
  type    = number
  default = 0
}

variable "payloads_user_interaction_message_finish" {
  type    = string
  default = ""
}


variable "testing_variable" {
  description = "This is a testing variable to check if the module is working correctly"
  type        = string
  default     = "Hello, World!"
}