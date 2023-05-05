#!/bin/bash

while IFS=: read -r s1 s2 s3 s4
do
    if [ $s3 -gt 999 ] && [ $s3 -lt 65000 ]
        then
        echo "$s1"
    fi
done < /etc/passwd