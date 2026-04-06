#!/bin/bash
# Liveness probe - checks if the vzlogger script is running and monitoring

# Check if the main process is running
if ! pgrep -f "vzlogger" > /dev/null; then
    echo "ERROR: vzloggeris not running"
    exit 1
fi

echo "OK: vzlogger is running"
exit 0
