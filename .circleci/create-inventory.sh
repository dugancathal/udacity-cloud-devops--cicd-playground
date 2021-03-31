#!/usr/bin/env bash

INVENTORY_FILE=server-inventory.txt
TAG=$1

echo '[all]' > "${INVENTORY_FILE}"
aws --profile=$AWS_PROFILE ec2 describe-instances \
  --query 'Reservations[*].Instances[*].PublicIpAddress' \
  --filters "Name=tag:DeployTag,Values=${TAG}" \
  --output text >> "${INVENTORY_FILE}"
