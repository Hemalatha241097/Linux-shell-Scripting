#!/bin/bash

#installation of mysql and git by cheching whether they are already installed or not. Also check the installation is successful or not

echo "Installing sql server..."

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
    then
    echo "You should use root to install sql server"
    exit 1
else
    dnf install mysql-server -y
fi