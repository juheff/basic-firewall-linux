#!/bin/bash

# Basic Firewall Script using iptables

# Flush existing rules
iptables -F
iptables -X

# Set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow incoming SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow incoming HTTP and HTTPS
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Allow ICMP (Ping)
iptables -A INPUT -p icmp -j ACCEPT

# Log dropped packets (optional)
iptables -A INPUT -j LOG --log-prefix "iptables: " --log-level 7

# Save the rules
iptables-save > /etc/iptables/rules.v4

echo "Firewall rules applied successfully."

