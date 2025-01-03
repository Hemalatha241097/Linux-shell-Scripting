#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
 then
 echo "This is not roor user"
 exit 1
else
 echo "This is root user"
fi 