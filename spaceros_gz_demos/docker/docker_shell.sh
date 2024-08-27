#!/bin/bash
echo "Launching a shell..."
export DOCKER_ID=$(docker ps | grep spaceros_gz_sim:latest | awk '{print $1;}')
docker exec -it $DOCKER_ID bash -c 'source /ros_entrypoint.sh && exec /bin/bash' # /ros_entrypoint.sh
