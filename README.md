# Basic Firewall for Linux

This is a basic firewall script for a Linux system using `iptables`. It sets up basic rules for handling incoming, outgoing, and forwarding traffic.

## Features

- Flushes existing rules and sets default policies
- Allows loopback traffic
- Allows established and related connections
- Allows incoming SSH, HTTP, and HTTPS traffic
- Allows ICMP (Ping) traffic
- Logs dropped packets (optional)

## Usage

1. Make the script executable:
   ```bash
   chmod +x basic_firewall.sh
