#!/usr/bin/env bash

STACK_NAME=$1
DEPLOY_TAG=$2

aws cloudformation create-stack \
  --stack-name=$STACK_NAME \
  --template-body=file://infra/servers.yml \
  --parameters ParameterKey=DeployTag,ParameterValue=$2
aws cloudformation wait stack-create-complete --stack-name=$STACK_NAME
