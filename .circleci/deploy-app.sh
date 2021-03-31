#!/usr/bin/env bash

ansible-playbook -i server-inventory.txt deploy/playbooks/app/main.yml
