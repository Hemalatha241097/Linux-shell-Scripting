#!/bin/bash

USER_ID=$(id)

if [ USER_ID -ne 0 ]
 then
 echo "This is not roor user"
else
 echo "This is root user"
fi 