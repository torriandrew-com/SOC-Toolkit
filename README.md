# SOC-Toolkit
PowerShell scripts for endpoint monitoring, hunting, and fast triage on Windows hosts. Focus: logs (Security, Sysmon, PowerShell), process trees, network connections, IOC sweeps. Safe-by-default (read-only), with clear `-WhatIf`/`-Confirm` where applicable.

## Quickstart
```powershell
# Clone and run from an elevated PowerShell
pwsh -NoProfile

# 1) Failed logins (last 24h, top IPs/users)
.\logging\win_failed_logins.ps1 -Hours 24 | Format-Table -Auto

# 2) Process creation events (4688) summary
.\logging\win_process_creation_4688.ps1 -Hours 6 | Select Time,User,Parent,CommandLine | more

# 3) Network connections + owning process
.\network\win_tcp_connections.ps1 | Sort-Object RemoteAddress | Format-Table -Auto

