#!/bin/bash
#set -x
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

[[ "$#" -ne 4 ]] && { echo "Usage : `basename "$0"` --email <user email or service account email> --days <1-365>"; exit 1; }
[[ "$1" = "--email" ]] &&  export EMAIL=$2
[[ "$3" = "--days" ]] &&  export DAYS=$4

function check_variables () {
    if [  -z "$project_id" ]; then
        printf "ERROR: GCP PROJECT_ID is not set.\n\n"
        printf "To view the current PROJECT_ID config: gcloud config list project \n\n"
        printf "To view available projects: gcloud projects list \n\n"
        printf "To update project config: gcloud config set project PROJECT_ID \n\n"
        exit
    fi
}

function find_permissions_in_logs () {
    gcloud logging read "protoPayload.authenticationInfo.principalEmail=${EMAIL}" --freshness=${DAYS}d --project=$(gcloud config list --format 'value(core.project)') --format json | jq -r '.[].protoPayload? | .authorizationInfo[] | [.permission,.resource] | join(",")'|sort -u
}

#check_variables
find_permissions_in_logs

