#!/bin/bash
 
# This adds a record to our backup log
 
echo backup started daily backup `date` >> /Scripts/Logs/Backup_log.txt
 
# This backs up the files
 
rsync -avu /location/of/mail/spool /Volumes/backup-volume/
 
# This adds another record to our backup log
 
echo backup daily backup completed `date` >> /Scripts/Logs/Backup_log.txt
 
# This emails the Sys Admin
 
NOW=$(date +"%m-%d-%Y")
 
SUBJECT="Email Backed Up - "$NOW""
 
EMAIL="email@user.com"
 
EMAILMESSAGE="/Scripts/Logs/Backup_log.txt"
 
mail -s "$SUBJECT" "$EMAIL" < "$EMAILMESSAGE"