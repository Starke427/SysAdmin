# Basic PowerShell script for enabling remote PowerShell sessions.
# Enables PSRemoting, allows connections from all hosts on the local firewall, and restarts Windows Remote Managment.
# This can be locked down by replacing '*' with the specific host IP that will be initiating remote connections.

# Enable PowerShell Remoting
Enable-PSRemoting -SkipNetworkProfileCheck -force

# Allow connections by adding hosts to the trusted hosts file, here we will allow any(*)
Set-Item wsman:/localhost/client/trustedhosts *

# Restart WinRM
Restart-Service WinRM
