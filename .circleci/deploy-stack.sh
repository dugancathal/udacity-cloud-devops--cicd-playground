#!/usr/bin/env bash

STACK_NAME=$1
DEPLOY_TAG=$2
ENV_COLOR=$3

aws cloudformation create-stack \
  --stack-name=$STACK_NAME \
  --template-body=file://infra/servers.yml \
  --parameters ParameterKey=DeployTag,ParameterValue=$DEPLOY_TAG ParameterKey=EnvColor,ParameterValue=$ENV_COLOR
aws cloudformation wait stack-create-complete --stack-name=$STACK_NAME
