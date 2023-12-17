# System Health Monitoring Bash Script

## Description
This script is designed to monitor the health of a Unix/Linux system by tracking CPU usage, disk space, and memory usage. It logs these metrics and can be configured to alert if certain thresholds are exceeded, making it a useful tool for system administrators and users who want to keep an eye on their system's health.

## Features
- Monitors CPU, disk, and memory usage.
- Logs system health information for review.
- Alerts for high usage based on predefined thresholds.

## Requirements
- Unix/Linux operating system.
- Bash shell environment.
- Necessary permissions to execute system commands.

## Installation
1. Download the `system_health_monitor.sh` script from the repository.
2. Change the permission to make the script executable:

`chmod +x system_health_monitor.sh`

## Usage
To run the script, simply execute it from the command line:

`./system_health_monitor.sh`

The script will log the system health information to `~/system_health.log`. You can view this file using commands like `cat` or `less`:

`cat ~/system_health.log`


## Customization
- The script currently logs CPU, disk, and memory usage. Additional metrics can be added as required.
- Thresholds for alerts are set at 80% usage but can be adjusted.

## Logs
Logs are stored in `~/system_health.log`. This file contains the historical data of your system's health metrics.

## License
[MIT](https://choosealicense.com/licenses/mit/)
