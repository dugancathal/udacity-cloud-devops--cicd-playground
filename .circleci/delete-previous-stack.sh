#!/usr/bin/env bash

set -xue

CURRENT_STACK_NAME=$1

PREVIOUS_STACK_NAME="$(aws cloudformation describe-stacks \
  --query "Stacks[?Parameters[?ParameterKey == 'EnvColor'] && StackName != '${CURRENT_STACK_NAME}'].StackName" \
  --output text \
)"

NUM_STACKS="$(echo "${PREVIOUS_STACK_NAME}" | sed '/^[[:space:]]*$/d' | wc -l | tr -d ' ' )"

if [[ "$NUM_STACKS" == '0' ]]; then
  echo "No stacks found matching criteria" >&2
  exit 0
elif [[ "$NUM_STACKS" > '1' ]]; then
  echo "Unable to delete stack!!! Multiple stacks found matching criteria" >&2
  echo "$PREVIOUS_STACK_NAME" >2
  exit 1
fi

./.circleci/delete-stack.sh "${PREVIOUS_STACK_NAME}"
