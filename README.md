# newman-executor

[![CircleCI](https://circleci.com/gh/sirech/newman-executor.svg?style=svg)](https://circleci.com/gh/sirech/newman-executor)

This repository is used to build a _Docker_ image that can be used to run [newman](https://www.npmjs.com/package/newman) in a CI/CD pipeline.

## Why an extra image?

There is an [official](https://hub.docker.com/r/postman/newman/) image to run `newman`. This one however contains some goodies like `bash` and `envsubst` that make parametrization easier. Also, it is based on a more recent [NodeJS](https://nodejs.org/en/) version.
