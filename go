#!/bin/bash

set -e
set -o nounset
set -o pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" ; pwd -P)

# shellcheck source=./go.variables
source "${SCRIPT_DIR}/go.variables"

goal_containerize() {
  docker build . -t $IMAGE
}

goal_test-container() {
  bundle install
  bundle exec rubocop
  bundle exec rspec spec
}

goal_help() {
  echo "usage: $0 <goal>

    goal:

    containerize             -- Build the docker container

    test-container           -- Run container tests
    "
  exit 1
}

main() {
  TARGET=${1:-}
  if [ -n "${TARGET}" ] && type -t "goal_$TARGET" &>/dev/null; then
    "goal_$TARGET" "${@:2}"
  else
    goal_help
  fi
}

main "$@"