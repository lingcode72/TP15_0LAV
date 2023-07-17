#!/bin/bash
sudo echo -e "[masters]\n\nmaster ansible_host=$(sudo terraform output -raw IP_pub_manager) ansible_user=azureuser\nmaster ansible_ssh_private_key_file=$(terraform output -raw private > id_rsa)\n\n[workers]\n\nworker0 ansible_host=$(sudo terraform output -raw IP_pub_worker_0) ansible_user=azureuser\nworker0\n\nworker0 ansible_host=$(sudo terraform output -raw IP_pub_worker_1) ansible_user=azureuser\nworker1 ansible_ssh_private_key_file=id_rsa" > inventory.ini 
sudo echo -e "[masters]\n\nmaster ansible_host=$(sudo terraform output -raw IP_pub_manager) ansible_user=$(terraform output -raw private)\nmaster ansible_ssh_private_key_file=id_rsa\n\n[workers]\n\nworker0 ansible_host=$(sudo terraform output -raw IP_pub_worker_0) ansible_user=$(terraform output -raw vm_usernames)\nworker0 ansible_host=$(sudo terraform output -raw IP_pub_worker_1) ansible_user=$(terraform output -raw vm_usernames)\nworker1 ansible_ssh_private_key_file=id_rsa" > inventory.ini
