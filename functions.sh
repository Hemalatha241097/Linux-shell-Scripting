#!/bin/bash

#!/bin/bash

#installation of mysql and git by cheching whether they are already installed or not. Also check the installation is successful or not

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]
    then
    echo "ERROR : You must have root access to install this script"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0]
        then
            echo "$2...FAILURE"
            exit 1
        else
             echo "$2...SUCCESS"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
    then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL server is already INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
    then
    dnf install gitt -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already INSTALLED"
fi
