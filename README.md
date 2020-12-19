# Ondemand IAM recommendation
This repository will assist with searching for permissions used by Google identity within a timespan of x days at the project level. With the output of a custom IAM role could be created for a persona or service account used for Infrastruture deployments. 

## Software Requirements

### Gcloud SDK
- [gcloud](https://cloud.google.com/sdk/docs/downloads-interactive)

### Java Query 
- [jq](https://stedolan.github.io/jq/)

## Usage
- find_iam_permissions.sh --email <your_email@example.com> --days <1-365>


