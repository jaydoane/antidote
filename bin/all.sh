#!/bin/bash

export RELX_REPLACE_OS_VARS=true
i=$1
   echo "stopping nodes..."
   ./bin/stop-nodes.sh ${i}
   echo "cleaning old releases..."
   make relclean
      echo "building new releases..."
   ./bin/build-releases.sh ${i}
   echo "launching nodes..."
   ./bin/launch-nodes.sh ${i}
   sllep ${i}*3
   echo "creating arg files..."
   ./bin/create-vm-file.sh ${i}
   echo "joining into cluster..."
   ./bin/join-nodes-into-cluster.sh ${i}
  sleep 1