#!/bin/bash

# System Health Monitoring Script

LOGFILE="$HOME/system_health.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Function to get CPU usage
check_cpu_usage() {
    CPU_USAGE=$(ps -A -o %cpu | awk '{s+=$1} END {print s "%"}')
    echo "CPU Usage: $CPU_USAGE"
}

# Function to get Disk usage
# Adjust the path according to your main partition if it's not '/'
check_disk_usage() {
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
    echo "Disk Usage: $DISK_USAGE"
}

# Function to get Memory usage
# This command may vary based on your Unix/Linux distribution
check_memory_usage() {
    MEMORY_USAGE=$(vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages free: (\d+)/ and $free=$1; END { printf("%.2f%%", 100-($free*$size)/(`sysctl -n hw.memsize`)*100); }')
    echo "Memory Usage: $MEMORY_USAGE"
}

# Function to log the details
log_details() {
    CPU=$(check_cpu_usage)
    DISK=$(check_disk_usage)
    MEMORY=$(check_memory_usage)
    echo "$DATE - $CPU, $DISK, $MEMORY" >> $LOGFILE
}

# Function to check for alerts
check_for_alerts() {
    if [[ $CPU_USAGE > 80% ]]; then
        echo "ALERT: High CPU usage"
    fi
    if [[ ${DISK_USAGE%?} -gt 80 ]]; then
        echo "ALERT: High Disk usage"
    fi
    if [[ $MEMORY_USAGE > 80% ]]; then
        echo "ALERT: High Memory usage"
    fi
}

# Main execution
log_details
check_for_alerts
