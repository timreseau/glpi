#!/bin/bash
docker-compose -f ./docker-compose-live.yml up -d
docker exec -it ansible /bin/sh -c "cd /ansible && export ANSIBLE_CONFIG=/ansible/ansible.cfg && /bin/bash"
