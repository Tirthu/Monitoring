#!/bin/bash

# Function to display top 10 CPU consuming processes
function display_cpu() {
    echo "Top 10 Applications by CPU Usage:"
    ps aux --sort=-%cpu | head -11
    echo ""
}

# Function to display top 10 memory consuming processes
function display_memory() {
    echo "Top 10 Applications by Memory Usage:"
    ps aux --sort=-%mem | head -11
    echo ""
}

# Function to monitor network statistics
function display_network() {
    echo "Network Statistics:"
    echo "Number of concurrent connections: $(ss -s | grep estab | awk '{print $4}')"
    echo "Packet drops: $(netstat -s | grep 'packets dropped' | awk '{print $1}')"
    
    # Check if ifstat is installed
    if command -v ifstat &> /dev/null; then
        echo "Network traffic (MB):"
        ifstat -t 1 1 | awk 'NR==3{print "In: "$6" MB, Out: "$8" MB"}'
    else
        echo "ifstat command not found. Please install it to monitor network traffic."
    fi
    
    echo ""
}

# Function to display disk usage by partitions
function display_disk() {
    echo "Disk Usage:"
    df -h | awk '$5 > 80 {print "Warning: Partition "$1" is using "$5" of space!"}'
    df -h
    echo ""
}

# Function to display system load and CPU breakdown
function display_load() {
    echo "System Load:"
    uptime
    echo "CPU Breakdown (user, system, idle, etc.):"
    mpstat | grep -A 5 "%idle"
    echo ""
}

# Function to display memory and swap usage
function display_memory_usage() {
    echo "Memory Usage:"
    free -h
    echo ""
}

# Function to display active processes and top 5 CPU and memory consuming processes
function display_processes() {
    echo "Active Processes: $(ps -e | wc -l)"
    echo "Top 5 CPU Consuming Processes:"
    ps aux --sort=-%cpu | head -6
    echo ""
    echo "Top 5 Memory Consuming Processes:"
    ps aux --sort=-%mem | head -6
    echo ""
}

# Function to monitor essential services like sshd, nginx/apache, iptables
function display_services() {
    echo "Service Status:"
    for service in sshd nginx apache2 iptables; do
        systemctl is-active --quiet $service && echo "$service is running" || echo "$service is not running"
    done
    echo ""
}

# Function to handle command-line switches
function handle_switches() {
    case $1 in
        -cpu)
            display_cpu
            ;;
        -memory)
            display_memory_usage
            ;;
        -network)
            display_network
            ;;
        -disk)
            display_disk
            ;;
        -load)
            display_load
            ;;
        -processes)
            display_processes
            ;;
        -services)
            display_services
            ;;
        *)
            echo "Invalid option. Available options are: -cpu, -memory, -network, -disk, -load, -processes, -services"
            ;;
    esac
}

# Check if a switch was provided
if [ $# -gt 0 ]; then
    handle_switches $1
else
    # Loop to refresh the dashboard every 5 seconds
    while true; do
        clear  # Clear the screen for a refreshed view
        display_cpu
        display_memory_usage
        display_network
        display_disk
        display_load
        display_processes
        display_services

        sleep 5  # Refresh every 5 seconds
    done
fi

