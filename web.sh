#!/bin/bash
DATE=$(date +%D-%T)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

yum install nginx -y
echo -e "$G installed nginx $N"

systemctl enable nginx

systemctl start nginx

rm -rf /usr/share/nginx/html/*

rm -rf /usr/share/nginx/html/*

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip

cd /usr/share/nginx/html

unzip /tmp/web.zip

cp /home/centos/swapna-shell/roboshop.conf /etc/nginx/default.d/roboshop.conf

systemctl restart nginx 