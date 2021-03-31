#!/usr/bin/env bash

python -m pip install ansible
ansible-playbook -i server-inventory.txt deploy/playbooks/app/main.yml
