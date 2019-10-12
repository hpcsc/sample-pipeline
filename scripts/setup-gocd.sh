#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function create-config-repo() {
    local repo_name=$1

    curl http://localhost:8153/go/api/admin/config_repos \
    -H 'Accept:application/vnd.go.cd.v2+json' \
    -H 'Content-Type:application/json' \
    --data-binary "@${SCRIPT_DIR}/config-repos/${repo_name}.json"
}

MAXIMUM_RETRIES=20
function wait-gocd-up() {
    local i=1
    while [[ $i -lt ${MAXIMUM_RETRIES} ]]
    do
        curl -sf http://localhost:8153/go/api/v1/health
        if [[ $? == 0 ]]; then
            echo "=== GoCD server is up"
            return
        fi;

        echo "=== Waiting for GoCD server to be up, retry $i"
        sleep 5s
        i=$((i+1))
    done

    echo "=== GoCD server is not up after ${MAXIMUM_RETRIES} retries"
    exit 1
}

wait-gocd-up
create-config-repo sample-pipeline-backend
create-config-repo sample-pipeline-mobile
create-config-repo sample-pipeline-system-tests
