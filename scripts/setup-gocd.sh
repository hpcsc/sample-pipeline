#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function create-config-repo() {
    local repo_name=$1

    curl 'http://localhost:8153/go/api/admin/config_repos' \
    -H 'Accept:application/vnd.go.cd.v2+json' \
    -H 'Content-Type:application/json' \
    --data-binary "@${SCRIPT_DIR}/config-repos/${repo_name}.json"
}

create-config-repo sample-pipeline-backend
create-config-repo sample-pipeline-mobile
create-config-repo sample-pipeline-system-tests
