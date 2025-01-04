#!/bin/bash

#installation of mysql and git by cheching whether they are already installed or not. Also check the installation is successful or not. Add all the logs to a single log file

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 |  cut -d "." -f1)
TIMESTAMP=$(date +%Y-%M-%D-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
    then
    echo "ERROR : You must have root access to install this script"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

VALIDATE(){
    if [ $1 -ne 0 ]
        then
            echo -e "$2...$R FAILURE $N"
            exit 1
        else
             echo -e "$2...$G SUCCESS $N"
    fi
}

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
    then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL server is already... $Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
    then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "Installing Git"
else
    echo "Git is already..$Y INSTALLED $N"
fi
