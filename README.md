# Sample Build Pipeline for Demonstration

![Pipeline Structure](https://raw.githubusercontent.com/hpcsc/sample-pipeline/master/sample-pipeline.png "Pipeline Structure")

This is the sample pipeline that I used to demonstrate build pipeline and some CD practices like pipeline as code. Setup and explanation is at [https://pnguyen.io/posts/a-sample-gocd-pipeline/](https://pnguyen.io/posts/a-sample-gocd-pipeline/)

The repository contains 3 git submodules:
- [https://github.com/hpcsc/sample-pipeline-backend](https://github.com/hpcsc/sample-pipeline-backend): backend build scripts and pipeline code
- [https://github.com/hpcsc/sample-pipeline-mobile](https://github.com/hpcsc/sample-pipeline-mobile): mobile build scripts and pipeline code
- [https://github.com/hpcsc/sample-pipeline-system-tests](https://github.com/hpcsc/sample-pipeline-system-tests): system tests build scripts and pipeline code

## Setup

### Assumptions

- GoCD server and Gogs are setup using docker-compose: [https://github.com/hpcsc/gocd](https://github.com/hpcsc/gocd)
- Default gogs user is registered with credentials:

```
Username: gogs
Password: password.123
```
- `jq`, `curl` are available
- Default ssh public key is available at `~/.ssh/id_rsa.pub`

### Setup

Run: `./scripts/setup.sh`

This script will call 2 sub-scripts to:

- Setup Gogs: clone all git submodules, upload default public key to Gogs, push submodules to Gogs
- Setup GoCD: create config repos in GoCD using REST API
