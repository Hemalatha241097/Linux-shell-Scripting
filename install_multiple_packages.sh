#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 |  cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

CHECK_ROOT(){

    if [ $USER_ID -ne 0 ]
    then
        echo "ERROR : You must have root access to install this script"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
        then
            echo -e "$2...$R FAILURE $N"
            exit 1
        else
             echo -e "$2...$G SUCCESS $N"
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    
    if [ $? -ne 0 ]
        then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already... $Y INSTALLED $N"
    fi
done
