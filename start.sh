#!/bin/bash
docker-compose up -d
docker exec -it ansible /bin/sh -c "cd /ansible && /bin/bash"



