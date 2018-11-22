#!/bin/sh
. inc/init.sh

ls run_*.sh | while read line; do
    echo "${GREEN}RUN${NC}   	./$line"
	./$line
done
