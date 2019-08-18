# Find VMs with drive media mounted

# First, how can I discover the commands PowerCLI provides for me?
Get-Command -Module vmware* -Verb get
Get-Command *iso* -Module vmware*
Get-Command *drive* -Module vmware*

# Ok, Get-CDDrive is what I want. How do I use it?
Get-Help Get-CDDrive -Full
Get-Help Get-CDDrive -Examples

# How can I find media mounted on any of Kyle's VMs?
$kyrd | Get-CDDrive
$kyrd | Get-CDDrive | Select *
Get-VM kr* | Get-CDDrive | Select-Object Parent, HostDevice, IsoPath

# Bonus: Eject mounted media (i.e. ISO files) from those drives
# Note that this typically errors out on Linux VMs
Get-VM kr* | Get-CDDrive | Where-Object IsoPath -Like * | Set-CDDrive -NoMedia
