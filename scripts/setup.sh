#!/bin/bash

set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

${SCRIPT_DIR}/setup-gogs.sh
${SCRIPT_DIR}/setup-gocd.sh
