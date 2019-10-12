#!/bin/bash

echo "=== updating git submodule"
git submodule update --init

echo "=== creating default gogs user"
./gogs/scripts/create-default-user.sh

echo "=== uploading default public key to gogs"
./gogs/scripts/upload-public-key.sh

echo "=== creating repositories in gogs"
./gogs/scripts/create-git-repo.sh sample-pipeline-backend sample-pipeline-mobile sample-pipeline-system-tests

echo "=== adding gogs remote"
git submodule foreach 'if [[ "$name" != "gogs" ]] && [[ -z "$(git remote | grep gogs)" ]]; then git remote add gogs ssh://git@localhost:10022/gogs/$name ; fi'

echo "=== pushing to gogs"
git submodule foreach 'if [[ "$name" != "gogs" ]]; then git push gogs master ; fi'

