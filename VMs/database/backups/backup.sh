#!/bin/bash

database="northwind"
username="north"
directory="/vagrant/backups"
timestamp=$(date +"%Y%m%d%H%M%S")
logfile=$directory/backup.log
filename=$1

log_message() {
    local MESSAGE=$1
    echo "$timestamp : $MESSAGE" | tee -a $logfile
}

# Validate dbpassword configuration
if [ -z  "$dbpassword" ]; then
    echo "Error: dbpassword does not exist"
    exit 1
fi

# Validate new argument
if [ -z  "$1" ]; then
    filename=${database}_${timestamp}.sql
else
    filename=${database}_${filename}.sql
fi

cd $directory

log_message "Starting $database backup"

if mysqldump -u $username --password=$dbpassword $database > $filename; then
    log_message "$database backup successfully completed on $filename"
else
    log_message "Something has gone wrong with the backup"
    exit 1
fi

log_message "Starting compression"
tar vcfz $filename.tar.gz $filename

log_message "Removing uncompressed file"
rm $filename

log_message "Compression successfully completed"
