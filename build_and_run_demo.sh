#! /bin/bash

/bin/bash configuration/scripts/configure_all.sh
/bin/bash modules/virtualization-server/runtime_container/build.sh
docker-compose up --build