#!/bin/bash

# Input email filter from Dockerfile ARG
email=$1

# Getting name of ID by email data
id_name=$(curl -s https://jsonplaceholder.typicode.com/comments | jq -r '.[]
        | select(.email=='\""${email}"\"')
        | .name')

# Checking the current TCP connection
built_time=$(date -u)
no_tcp_con=$(netstat -an | grep -c tcp)

# Input content into default nginx page in html
cat >/usr/share/nginx/html/index.html <<EOF
<h2><strong>Here is the content output</strong></h2>
<p>The name of the entity identified by email <strong>${email}</strong> : <strong>${id_name}</strong><br />
The number of active TCP connections on the machine at the time (<strong>${built_time}</strong>) of building the image : <strong>${no_tcp_con}</strong></p>
EOF
