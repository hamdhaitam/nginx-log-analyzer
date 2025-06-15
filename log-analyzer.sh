#!/bin/bash

# Top 5 IP addresses with the most requests
TOP_IP_PER_REQUEST=$(awk '{ print $1 }' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{ printf("%s - %s requests\n"), $2, $1 }')
echo -e "Top 5 IP addresses with the most requests: "
echo "$TOP_IP_PER_REQUEST"

# Top 5 most requested paths
TOP_REQ_PATHS=$(awk '{print $7}' nginx-access.log | grep -Eo '^\/v1-[^\/]+\/' | sort | uniq -c | sort -nr | head -n 5 | awk '{ printf("%s - %s requests\n"), $2, $1 }')
echo -e "\nTop 5 most requested paths: "
echo "$TOP_REQ_PATHS"

# Top 5 response status codes
TOP_RES_PER_STATUS_CODE=$(awk '{ print $9 }' nginx-access.log | grep -E '^[0-9]{3}$' | sort | uniq -c | sort -nr | head -n 5 | awk '{ printf("%s - %s requests\n"), $2, $1 }')
echo -e "\nTop 5 response status codes: "
echo "$TOP_RES_PER_STATUS_CODE"

# Top 5 user agents
TOP_USER_AGENTS=$(awk -F'"' '{ print $6 }' nginx-access.log | sort | uniq -c | sort -nr | head -n 5)
echo -e "\nTop 5 user agents: "
echo "$TOP_USER_AGENTS"