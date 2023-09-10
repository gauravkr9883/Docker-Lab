## Script for db_backup upload to AWS s3

#!/bin/bash

DATE=$(date +%H-%M-%S)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_PASSWD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

mysqldump -u root -h $DB_HOST -p$DB_PASSWD $DB_NAME > /tmp/db-$DATE.sql
export AWS_ACCESS_KEY_ID=AKIAWHDFI3VBDRIYDDER
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET
echo "uploading your $BACKUP backup"
aws s3 cp /tmp/$BACKUP s3://BUCKET_NAME/$BACKUP

