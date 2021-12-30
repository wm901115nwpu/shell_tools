#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Useage: <cmd> <root_dir>"
    exit -1
fi

root="$1"
if [ ! -d ${root} ]
then
    echo "Directory ${root} not found!"
    exit -1
fi  

echo "Build cscope.files..."
find "${root}" -name "*.py" > "${root}/cscope.files"
echo "Build cscope db...."
cscope -Rbqd
