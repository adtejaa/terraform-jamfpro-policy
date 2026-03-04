# Icon resource - uploads icon file if provided
resource "jamfpro_icon" "self_service_icon" {
  count            = var.self_service_icon_file_path != null ? 1 : 0
  icon_file_path   = var.self_service_icon_file_path
}

resource "jamfpro_policy" "policy" {
  name                          = var.name
  enabled                       = var.enabled
  trigger_checkin               = var.trigger_checkin
  trigger_enrollment_complete   = var.trigger_enrollment_complete
  trigger_login                 = var.trigger_login
  trigger_network_state_changed = var.trigger_network_state_changed
  trigger_startup               = var.trigger_startup
  trigger_other                 = var.trigger_other
  frequency                     = var.frequency
  retry_event                   = var.retry_event
  retry_attempts                = var.retry_attempts
  notify_on_each_failed_retry   = var.notify_on_each_failed_retry
  target_drive                  = var.target_drive
  offline                       = var.offline
  category_id                   = var.category_id
  site_id                       = var.site_id
  network_requirements          = var.network_requirements != "" ? var.network_requirements : null
  package_distribution_point    = var.package_distribution_point

  scope {
    all_computers      = var.all_computers
    all_jss_users      = var.all_jss_users
    computer_ids       = var.computer_ids
    computer_group_ids = var.computer_group_ids
    building_ids       = var.building_ids
    department_ids     = var.department_ids
    jss_user_ids       = var.jss_user_ids
    jss_user_group_ids = var.jss_user_group_ids

    dynamic "limitations" {
      for_each = (length(var.scope_limitations_network_segment_ids) > 0 || 
                  length(var.scope_limitations_ibeacon_ids) > 0 || 
                  length(var.scope_limitations_directory_usernames) > 0 || 
                  length(var.scope_limitations_directory_user_groups) > 0) ? [1] : []
      content {
        network_segment_ids                  = var.scope_limitations_network_segment_ids
        ibeacon_ids                          = var.scope_limitations_ibeacon_ids
        directory_service_or_local_usernames = var.scope_limitations_directory_usernames
        directory_service_usergroup_ids      = var.scope_limitations_directory_user_groups
      }
    }

    dynamic "exclusions" {
      for_each = (length(var.scope_exclusions_computer_ids) > 0 || 
                  length(var.scope_exclusions_computer_group_ids) > 0 || 
                  length(var.scope_exclusions_building_ids) > 0 || 
                  length(var.scope_exclusions_department_ids) > 0 || 
                  length(var.scope_exclusions_network_segment_ids) > 0 || 
                  length(var.scope_exclusions_jss_user_ids) > 0 || 
                  length(var.scope_exclusions_jss_user_group_ids) > 0 || 
                  length(var.scope_exclusions_directory_usernames) > 0 || 
                  length(var.scope_exclusions_directory_user_groups) > 0 || 
                  length(var.scope_exclusions_ibeacon_ids) > 0) ? [1] : []
      content {
        computer_ids                         = var.scope_exclusions_computer_ids
        computer_group_ids                   = var.scope_exclusions_computer_group_ids
        building_ids                         = var.scope_exclusions_building_ids
        department_ids                       = var.scope_exclusions_department_ids
        network_segment_ids                  = var.scope_exclusions_network_segment_ids
        jss_user_ids                         = var.scope_exclusions_jss_user_ids
        jss_user_group_ids                   = var.scope_exclusions_jss_user_group_ids
        directory_service_or_local_usernames = var.scope_exclusions_directory_usernames
        directory_service_usergroup_ids      = var.scope_exclusions_directory_user_groups
        ibeacon_ids                          = var.scope_exclusions_ibeacon_ids
      }
    }
  }

  dynamic "date_time_limitations" {
    for_each = (var.date_time_activation_date != null || 
                var.date_time_expiration_date != null || 
                length(var.date_time_no_execute_on) > 0) ? [1] : []
    content {
      activation_date       = var.date_time_activation_date
      expiration_date       = var.date_time_expiration_date
      no_execute_on         = var.date_time_no_execute_on
      no_execute_start      = var.date_time_no_execute_start
      no_execute_end        = var.date_time_no_execute_end
    }
  }

  dynamic "network_limitations" {
    for_each = (var.network_limitations_any_ip_address != true || 
                var.network_limitations_minimum_network_connection != "No Minimum") ? [1] : []
    content {
      minimum_network_connection = var.network_limitations_minimum_network_connection
      any_ip_address             = var.network_limitations_any_ip_address
    }
  }

  payloads {
    dynamic "packages" {
      for_each = length(var.payloads_packages) > 0 ? [1] : []
      content {
        distribution_point = var.payloads_packages_distribution_point
        dynamic "package" {
          for_each = var.payloads_packages
          content {
            id                          = package.value
            action                      = length(var.payloads_packages_actions) > package.key ? var.payloads_packages_actions[package.key] : "Install"
            fill_user_template          = var.payloads_packages_fill_user_template
            fill_existing_user_template = var.payloads_packages_fill_existing_user_template
          }
        }
      }
    }

    dynamic "scripts" {
      for_each = var.payloads_scripts_ids
      content {
        id          = scripts.value
        priority    = length(var.payloads_scripts_priorities) > scripts.key ? var.payloads_scripts_priorities[scripts.key] : "After"
        parameter4  = try(var.payloads_scripts_parameter4[scripts.key], var.payloads_scripts_parameter4)
        parameter5  = try(var.payloads_scripts_parameter5[scripts.key], var.payloads_scripts_parameter5)
        parameter6  = try(var.payloads_scripts_parameter6[scripts.key], var.payloads_scripts_parameter6)
        parameter7  = try(var.payloads_scripts_parameter7[scripts.key], var.payloads_scripts_parameter7)
        parameter8  = try(var.payloads_scripts_parameter8[scripts.key], var.payloads_scripts_parameter8)
        parameter9  = try(var.payloads_scripts_parameter9[scripts.key], var.payloads_scripts_parameter9)
        parameter10 = try(var.payloads_scripts_parameter10[scripts.key], var.payloads_scripts_parameter10)
        parameter11 = try(var.payloads_scripts_parameter11[scripts.key], var.payloads_scripts_parameter11)
      }
    }

    dynamic "disk_encryption" {
      for_each = var.payloads_disk_encryption_action != "" ? [1] : []
      content {
        action                                     = var.payloads_disk_encryption_action
        disk_encryption_configuration_id           = var.payloads_disk_encryption_configuration_id
        auth_restart                               = var.payloads_disk_encryption_auth_restart
        remediate_key_type                         = var.payloads_disk_encryption_remediate_key_type
        remediate_disk_encryption_configuration_id = var.payloads_disk_encryption_remediate_configuration_id
      }
    }

    dynamic "printers" {
      for_each = var.payloads_printers_id != 0 ? [1] : []
      content {
        id           = var.payloads_printers_id
        name         = var.payloads_printers_name
        action       = var.payloads_printers_action
        make_default = var.payloads_printers_make_default
      }
    }

    dynamic "reboot" {
      for_each = var.payloads_reboot_message != "" ? [1] : []
      content {
        message                        = var.payloads_reboot_message
        specify_startup                = var.payloads_reboot_specify_startup
        startup_disk                   = var.payloads_reboot_startup_disk
        minutes_until_reboot           = var.payloads_reboot_minutes_until_reboot
        file_vault_2_reboot            = var.payloads_reboot_file_vault_2_reboot
      }
    }

    dynamic "maintenance" {
      for_each = (var.payloads_maintenance_recon || var.payloads_maintenance_reset_name || var.payloads_maintenance_install_all_cached_packages || 
                  var.payloads_maintenance_heal || var.payloads_maintenance_prebindings || var.payloads_maintenance_permissions || 
                  var.payloads_maintenance_byhost || var.payloads_maintenance_system_cache || var.payloads_maintenance_user_cache || 
                  var.payloads_maintenance_verify) ? [1] : []
      content {
        recon                       = var.payloads_maintenance_recon
        reset_name                  = var.payloads_maintenance_reset_name
        install_all_cached_packages = var.payloads_maintenance_install_all_cached_packages
        heal                        = var.payloads_maintenance_heal
        prebindings                 = var.payloads_maintenance_prebindings
        permissions                 = var.payloads_maintenance_permissions
        byhost                      = var.payloads_maintenance_byhost
        system_cache                = var.payloads_maintenance_system_cache
        user_cache                  = var.payloads_maintenance_user_cache
        verify                      = var.payloads_maintenance_verify
      }
    }

    dynamic "files_processes" {
      for_each = (var.payloads_files_processes_search_by_path != "" || 
                  var.payloads_files_processes_locate_file != "" || 
                  var.payloads_files_processes_spotlight_search != "" || 
                  var.payloads_files_processes_search_for_process != "" || 
                  var.payloads_files_processes_run_command != "") ? [1] : []
      content {
        search_by_path         = var.payloads_files_processes_search_by_path
        delete_file            = var.payloads_files_processes_delete_file
        locate_file            = var.payloads_files_processes_locate_file
        update_locate_database = var.payloads_files_processes_update_locate_database
        spotlight_search       = var.payloads_files_processes_spotlight_search
        search_for_process     = var.payloads_files_processes_search_for_process
        kill_process           = var.payloads_files_processes_kill_process
        run_command            = var.payloads_files_processes_run_command
      }
    }

    dynamic "dock_items" {
      for_each = length(var.payloads_dock_items_ids) > 0 ? var.payloads_dock_items_ids : []
      content {
        id     = dock_items.value
        name   = length(var.payloads_dock_items_names) > dock_items.key ? var.payloads_dock_items_names[dock_items.key] : ""
        action = length(var.payloads_dock_items_actions) > dock_items.key ? var.payloads_dock_items_actions[dock_items.key] : "Add To End"
      }
    }

    dynamic "user_interaction" {
      for_each = (var.payloads_user_interaction_message_start != "" || 
                  var.payloads_user_interaction_message_finish != "" || 
                  var.payloads_user_interaction_allow_users_to_defer) ? [1] : []
      content {
        message_start            = var.payloads_user_interaction_message_start
        allow_users_to_defer     = var.payloads_user_interaction_allow_users_to_defer
        allow_deferral_until_utc = var.payloads_user_interaction_allow_deferral_until_utc
        allow_deferral_minutes   = var.payloads_user_interaction_allow_deferral_minutes
        message_finish           = var.payloads_user_interaction_message_finish
      }
    }
  }

  dynamic "self_service" {
    for_each = var.self_service_use_for_self_service ? [1] : []
    content {
      use_for_self_service            = var.self_service_use_for_self_service
      self_service_display_name       = var.self_service_display_name
      self_service_description        = var.self_service_description
      install_button_text             = var.self_service_install_button_text
      reinstall_button_text           = var.self_service_reinstall_button_text
      self_service_icon_id            = var.self_service_icon_file_path != null ? jamfpro_icon.self_service_icon[0].id : null
      force_users_to_view_description = var.self_service_force_users_to_view_description
      feature_on_main_page            = var.self_service_feature_on_main_page
      notification                    = var.self_service_notification
      notification_subject            = var.self_service_notification_subject
      notification_message            = var.self_service_notification_message
      notification_type = var.self_service_notification_type != "" ? var.self_service_notification_type : null
      dynamic "self_service_category" {
        for_each = var.self_service_category_id != null ? [1] : []
        content {
          id         = var.self_service_category_id
          display_in = var.self_service_category_display_in
          feature_in = var.self_service_category_feature_in
        }
      }
    }
  }
}
