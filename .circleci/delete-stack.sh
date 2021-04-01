#!/usr/bin/env bash

STACK_NAME=$1

echo "Deleting $STACK_NAME" >&2
aws cloudformation delete-stack --stack-name "${STACK_NAME}"
