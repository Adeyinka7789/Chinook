#!/bin/bash
#use for cronjob
MYSQL_USER="root"
MYSQL_PASSWORD="Omowunmi77897789"
MYSQL_HOST="127.0.0.1"
MYSQL_DB="sakila"
BACKUP_DIR="/mnt/c/Users/USER/Desktop/Backup"
DATE=$(date +'%Y%m%d_%H%M')
BACKUP_FILE="${BACKUP_DIR}/${MYSQL_DB}_backup_${DATE}.sql"
LOG_FILE="${BACKUP_DIR}/backup_${DATE}.log"

echo "Backup started at $(date)" > "$LOG_FILE"
echo "Backing up MySQL database: $MYSQL_DB" >> "$LOG_FILE"

"/mnt/c/Program Files/MySQL/MySQL Server 8.0/bin/mysqldump.exe" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" --protocol=tcp "$MYSQL_DB" > "$BACKUP_FILE" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully at $(date)" >> "$LOG_FILE"
else
    echo "Backup FAILED at $(date)" >> "$LOG_FILE"
fi 

echo "Backup file stored at: $BACKUP_FILE" >> "$LOG_FILE"
