env_name          = "dev"
project           = "fe-dfoley"
region            = "us-west1"
zones             = ["us-west1-a", "us-west1-b", "us-west1-c"]
dns_suffix        = "gcp.dfoleypivotal.com"
opsman_image_url  = "https://storage.googleapis.com/ops-manager-us/pcf-gcp-2.4-build.152.tar.gz"
external_database = true
opsman_vm         = false

ssl_cert = <<SSL_CERT
SSL_CERT

ssl_private_key = <<SSL_KEY
SSL_KEY

service_account_key = <<SERVICE_ACCOUNT_KEY
SERVICE_ACCOUNT_KEY
