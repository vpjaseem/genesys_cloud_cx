# Data Colelction from the available resources
data "genesyscloud_auth_division" "genesys_division" {
  name = "A_DIVISION_01"
}

data "genesyscloud_routing_wrapupcode" "genesys_wrapupcode" {
  name = "AJ_GENERAL_ENQUIRY"
}

data "genesyscloud_user" "user01" {
  email = "priya01@technex.com"
}

data "genesyscloud_user" "user02" {
  email = "ramya02@technex.com"
}

# Creating Queue
resource "genesyscloud_routing_queue" "AJ_TF_TECH_SUPPORT_QUEUE" {
  # General Settings
  name                          = "AJ_TF_TECH_SUPPORT_QUEUE"
  division_id                   = data.genesyscloud_auth_division.genesys_division.id
  description                   = "AJ_TF_TECH_SUPPORT_QUEUE"
  acw_wrapup_prompt             = "OPTIONAL"
  enable_manual_assignment      = false
  auto_answer_only              = false
  
  # Routing 
  skill_evaluation_method       = "ALL"
  
  # Members
  members {
    user_id = data.genesyscloud_user.user01.id
    }
  
  members {
    user_id= data.genesyscloud_user.user02.id
    }
  
  # Wrapup Codes
  wrapup_codes = [
    data.genesyscloud_routing_wrapupcode.genesys_wrapupcode.id
    ]

  # Interaction media settings
  media_settings_call {
    alerting_timeout_sec        = 8
    service_level_percentage    = 0.80
    service_level_duration_ms   = 20000
    }

  calling_party_name            = "AJ Labs"
  calling_party_number          = "+12148883759"

  media_settings_chat {
    alerting_timeout_sec        = 8
    service_level_percentage    = 0.80
    service_level_duration_ms   = 20000
    }

  media_settings_message {
    alerting_timeout_sec        = 8
    service_level_percentage    = 0.80
    service_level_duration_ms   = 20000
    }

  media_settings_email {
    alerting_timeout_sec        = 8
    service_level_percentage    = 0.80
    service_level_duration_ms   = 20000
    }

  media_settings_callback {
    alerting_timeout_sec        = 8
    service_level_percentage    = 0.80
    service_level_duration_ms   = 20000
    }
}