#!/usr/bin/env bash
docker-compose up -d
ansible-playbook site.yml -i inventory/prod.yml --vault-password-file pass.txt
docker-compose down
