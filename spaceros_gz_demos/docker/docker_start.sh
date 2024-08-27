#!/bin/bash
echo "Starting docker container..."
docker run -it \
  --network host \
  -e DISPLAY \
  -e TERM \
  -e ROS_DOMAIN_ID=$ROS_DOMAIN_ID \
  -e QT_X11_NO_MITSHM=1 \
  --device /dev/dri \
  --mount type=bind,source="$(pwd)/../spaceros_gz_demos",target=/home/spaceros-user/spaceros/ws/src/spaceros_gz_demos \
  spaceros_gz_sim:latest
