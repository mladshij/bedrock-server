#!/bin/bash

server=$1
base_dir="/home/ec2-user/mcpe/MCPE"
work_dir="${base_dir}"/"${server}"

mkdir -p "${work_dir}"
touch "${work_dir}"/whitelist.json
touch "${work_dir}"/server.properties
touch "${work_dir}"/permissions.json

docker run -d -p 19132-19133:19132-19133/udp -h ${server} --name=mc-${server}\
 -v "${work_dir}/whitelist.json:/opt/minecraft/whitelist.json:z"\
 -v "${work_dir}/server.properties:/opt/minecraft/server.properties:z"\
 -v "${work_dir}/permissions.json:/opt/minecraft/permissions.json:z"\
 -v "${work_dir}/worlds:/opt/minecraft/worlds:z"\
 mladshij/bedrockserver
