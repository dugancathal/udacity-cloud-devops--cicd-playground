#!/usr/bin/env bash

STACK_NAME=$1

current_color="$(aws cloudformation describe-stacks \
  --stack-name="$STACK_NAME" \
  --query "Stacks[0].Parameters[?ParameterKey == 'EnvColor'].ParameterValue" \
  --output text)"

next_color="green"

if [[ -z "$current_color" ]]; then
  next_color="blue"
elif [[ "$current_color" == "green" ]]; then
  next_color="blue"
else
  next_color="green"
fi

echo "${next_color}"
