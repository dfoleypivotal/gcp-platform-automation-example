# gcp-platform-automation-example
This repository contains an example Concourse pipeline to deploy PCF on GCP using Platform Automation

## Pipeline Setup & Usage

#### Required Manual GCP Steps - State File & Bucket

The pipeline tracks OpsMan VM state using a state file. These files are stored either in git or GCS (or S3). This example pipeline uses GCS. There is manual setup required for this. Manually create a versioned Google Cloud Storage bucket to store the state files. Then you need to manually create a state file for each opsman that you intend to build. The filename needs to be OPSMAN_NAME.state. 

For example:

```
gsutil mb gs://gcp-dev-state-dfoley
gsutil versioning set on gs://gcp-dev-state-dfoley
touch state.yml
gsutil cp state.yml gs://gcp-dev-state-dfoley
```

### Required Credhub Variables

In order to set the variables in the correct Credhub (the one deployed with Concourse), it is necessary to run the `./target-concourse-credhub.sh` script from your `control-plane` folder.

The following variables must be set in the concourse credhub that was deployed earlier.

- /concourse/dev/storage\_account_key - `terraform output pas_blobstore_gcp_service_account_key`
- /concourse/dev/db_password - `terraform output pas_sql_password`
- /concourse/dev/uaa_pem - PAS certs
- /concourse/dev/credhub\_key\_encryption_password
- /concourse/dev/pivnet_token
- /concourse/dev/git\_private_key
- /concourse/dev/opsman_password
- /concourse/dev/opsman_decryption_passphrase
- /concourse/dev/state_bucket_key - `gcp service account key that can talk to the state bucket`
- /concourse/dev/opsman_service_account_json - `terraform output opsman_service_account_key`

