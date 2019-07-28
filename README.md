# SysAdmin
The following scripts are intended to help simplify system administration.

# enable_PSSession.ps1
Basic PowerShell script that enables PSRemoting, allows connections from all hosts on the local firewall over tcp/3389, and restarts Windows Remote Managment.

# service_manager.ps1
This script allows you to define several services and simplify starting, stopping, enabling, and disabling them on Windows. It must be run by a user with sufficient permissions to modify the target services.

# service_manager.sh
This script allows you to define several services and simplify starting, stopping, restarting, enabling, disabling, and getting their status. It can be run by non-root users with sudo privledges.
