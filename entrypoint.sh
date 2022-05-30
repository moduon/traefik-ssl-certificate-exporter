#!/bin/bash

export CRON_TIME
export CERT_OWNER_ID
export CERT_GROUP_ID

# Start the job.
CURRENTDATE=$(date +'%Y-%m-%d %T')
echo "${CURRENTDATE}: Docker container has been started. You can find the log file at /var/log/cron.log"

# Run it now
if [ "$ON_START" == 1 ]; then
    /app/cert-export.sh
fi

# Setup a cron schedule
echo "${CRON_TIME} /app/cert-export.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f
