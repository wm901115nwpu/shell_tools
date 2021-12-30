#!/bin/bash
if [ $# -ne 2 ]
then
    echo "Useage: <command> <image_name> <image_tag>"
    exit -1
fi

imgName=$1
imgTag=$2

echo run docker image ${imgName}:${imgTag}

docker run --gpus all \
    --env NVIDIA_DRIVER_CAPABILITIES="utility,compute" \
    -v "${HOME}/data:/mnt/data" \
    -u root \
    -w /root \
    -it ${imgName}:${imgTag}

