#!/bin/bash

echo "=== update git submodule"
git submodule update --init --remote

echo "=== adding gogs remote"
git submodule foreach 'if [[ -z "$(git remote | grep gogs)" ]]; then git remote add gogs ssh://git@localhost:10022/gogs/$name ; fi'

echo "=== pushing to gogs"
git submodule foreach 'git push gogs master'
