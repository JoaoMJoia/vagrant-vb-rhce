#!/bin/bash

PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -o IdentityFile=/home/********/.vagrant.d/insecure_private_key -o ForwardAgent=yes -o ControlMaster=auto -o ControlPersist=60s' ansible -b -m shell -a "subscription-manager unregister" --connection=ssh --timeout=30 --extra-vars=ansible_user\=\'vagrant\' --inventory-file=ansible/inventory all

vagrant destroy -f
