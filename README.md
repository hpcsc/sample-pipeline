# Sample Build Pipeline for Demonstration

![Pipeline Structure](https://raw.githubusercontent.com/hpcsc/sample-pipeline/master/sample-pipeline.png "Pipeline Structure")

This is the sample pipeline that I used to demonstrate build pipeline and some CD practices like pipeline as code. Setup and explanation is at [https://pnguyen.io/posts/a-sample-gocd-pipeline/](https://pnguyen.io/posts/a-sample-gocd-pipeline/)

The repository contains 3 git submodules:
- [https://github.com/hpcsc/sample-pipeline-backend](https://github.com/hpcsc/sample-pipeline-backend): backend build scripts and pipeline code
- [https://github.com/hpcsc/sample-pipeline-mobile](https://github.com/hpcsc/sample-pipeline-mobile): mobile build scripts and pipeline code
- [https://github.com/hpcsc/sample-pipeline-system-tests](https://github.com/hpcsc/sample-pipeline-system-tests): system tests build scripts and pipeline code

## Setup

Assuming GoCD server is setup using docker-compose like: [https://github.com/hpcsc/gocd](https://github.com/hpcsc/gocd) and Gogs local git server is available on localhost

- Run:
```
./scripts/setup.sh
```
- Go to GoCD, update Config XML to use config repositories above. Sample GoCD config XML is at `sample-gocd-config.xml`
