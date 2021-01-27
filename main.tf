terraform {
  required_providers {
    pingfederate = {
      source  = "iwarapter/pingfederate"
      version = "0.0.8"
    }
  }
}

provider "pingfederate" {
  password = "2FederateM0re"
}

resource "pingfederate_notification_publisher" "mailserver" {
  name         = "demo"
  publisher_id = "demo"
  plugin_descriptor_ref {
    id = "com.pingidentity.email.SmtpNotificationPlugin"
  }

  configuration {
    fields {
      name  = "From Address"
      value = "someone@test.com"
    }
    fields {
      name  = "Email Server"
      value = "email-smtp.eu-west-1.amazonaws.com"
    }
    fields {
      name  = "SMTP Port"
      value = "25"
    }
    fields {
      name  = "Encryption Method"
      value = "SSL"
    }
    fields {
      name  = "SMTPS Port"
      value = "465"
    }
    fields {
      name  = "Verify Hostname"
      value = "false"
    }
    fields {
      name  = "Username"
      value = "someone"
    }
    sensitive_fields {
      name  = "Password"
      value = var.mail_server_password
    }
    fields {
      name  = "Test Address"
      value = "example@test.com"
    }
    fields {
      name  = "Connection Timeout"
      value = "30"
    }
    fields {
      name  = "Retry Attempt"
      value = "2"
    }
    fields {
      name  = "Retry Delay"
      value = "2"
    }
    fields {
      name  = "Enable SMTP Debugging Messages"
      value = "false"
    }
  }
}

variable "mail_server_password" {
  type      = string
  sensitive = true
  default = "secret"
}