terraform {
  required_version = "~> 1.14.3"
  required_providers {
    genesyscloud = {
      source  = "mypurecloud/genesyscloud"
      version = "~> 1.0.0"
    }
  }
}

provider "genesyscloud" {
  oauthclient_id = "xxxxxxxxxxxxxxxxxxxxxxx"
  oauthclient_secret = "xxxxxxxxxxxxxxxxxxxxxxx"
  aws_region = "us-west-2"
}
