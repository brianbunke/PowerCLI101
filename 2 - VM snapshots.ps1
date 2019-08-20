# Deleting old VM snapshots
# In this example, any snapshot that has existed for at least 10 seconds is "old"

# First, how can I discover the commands PowerCLI provides for me?
Get-Command -Name get* -Module vmware*
Get-Command *snap* -Module vmware*

# Ok, Get-Snapshot is what I want. How do I use it?
Get-Help Get-Snapshot -Full
Get-Help Get-Snapshot -Examples

# First, create a "powered off" snapshot
$kyrd | New-Snapshot -Name frozen -RunAsync

# Bonus: All the commands that support asynchronous (long-running) tasks
Get-Command -Module vmware* -ParameterName RunAsync

# Get info about snapshots
Get-VM -Name kr* | Get-Snapshot
Get-VM -Name kr* | Get-Snapshot | Select-Object -Property *
Get-VM -Name kr* | Get-Snapshot | Select-Object VM, Name, PowerState, Created

# How do I get "10 seconds ago" in PowerShell?
(Get-Date).AddSeconds(-10)

# For all snapshots created prior to 10 seconds ago, delete them
Get-VM -Name kr* | Get-Snapshot | Where-Object {$_.Created -lt (Get-Date).AddSeconds(-10)} | Remove-Snapshot
