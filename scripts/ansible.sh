#!/bin/bash

IP=$1

echo "Waiting for EC2 instance..."

sleep 60

cd ../ansible

echo "[web]" > inventory

echo "$IP ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/id_rsa" >> inventory

ansible-playbook -i inventory install-tools.yaml
