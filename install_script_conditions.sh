#!/bin/bash

#installation of mysql and git by cheching whether they are already installed or not. Also check the installation is successful or not

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
    then
    echo "ERROR : You must have root access to install this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
    then
    dnf install mysql -y
    if [ $? -ne 0 ]
        then 
        echo "Installing mySQL...FAILURE"
        exit 1
    else
        echo "Installing mySQL....SUCCESS"  
    fi 
else
    echo "MySQL server is already INSTALLED"
fi





