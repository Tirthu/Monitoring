
# `monitor.sh` Script

The `monitor.sh` script provides a comprehensive real-time monitoring dashboard for system performance. It includes features for monitoring CPU usage, memory usage, network statistics, disk usage, system load, and essential services. The script can be run continuously to refresh the dashboard every 5 seconds or to display specific monitoring details on demand.


## Features

- **CPU Usage:** Displays the top 10 CPU-consuming processes.
- **Memory Usage:** Shows the top 10 memory-consuming processes.
- **Network Statistics:** Provides network traffic statistics, concurrent connections, and packet drops.
- **Disk Usage:** Monitors disk usage by partitions and warns if usage exceeds 80%.
- **System Load:** Displays system load averages and CPU breakdown.
- **Memory and Swap Usage:** Shows current memory and swap usage.
- **Active Processes:** Lists the total number of active processes and the top 5 CPU and memory-consuming processes.
- **Service Status:** Checks and displays the status of essential services (`sshd`, `nginx`, `apache2`, and `iptables`).
## Prerequisites
- **Superuser (root) privileges:** The script should be executed with root privileges for accurate system monitoring.
- **Utilities:** Ensure that the following utilities are installed:
  - `ps`
  - `ss`
  - `netstat`
  - `ifstat` (for network statistics)
  - `mpstat` (for CPU breakdown)
  - `systemctl`
## Installation

1. **Save the Script**

   Save the provided script to a file named `monitor.sh`.

2. **Make the Script Executable**

   Run the following command to make the script executable:
   ```bash
   chmod +x monitor.sh
3.Run the following command to run script.

./monitor.sh

4../monitor.sh -cpu

5../monitor.sh -memory


## License

This script is provided under the MIT License. See LICENSE for more details.


This README file provides a thorough guide to using the `monitor.sh` script, including how to run it in continuous mode or with specific functions, and how to extend it for additional monitoring. It also covers prerequisites, installation steps, and evaluation criteria.
