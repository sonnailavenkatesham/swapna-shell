#!/bin/bash
DATE=$(date +%D-%T)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

yum install nginx -y
echo -e "$G installed nginx $N"

systemctl enable nginx
echo -e "$G enabled nginx $N"

systemctl start nginx
echo -e "$G started nginx $N"

rm -rf /usr/share/nginx/html/*
echo -e "$G default nginx page deleted $N"
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

cd /usr/share/nginx/html

unzip /tmp/web.zip
echo -e "$G unziped web data $N"

cp /home/centos/swapna-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf

systemctl restart nginx 
echo -e "$G restarted nginx $N"