# IAM 
This repository will assist with searching for permissions used by Google identity within a timespan of x days at the project level. With the output of a custom IAM role could be created for a persona or service account used for Infrastruture deployments. 

## Software Requirements

### Gcloud SDK
- [gcloud](https://www.terraform.io/downloads.html) 0.12.x

### Java Query 
- [jq]

## Usage
- find_iam_permissions.sh --email <your_email@example.com> --days <1-365>


