# Establish a connection to your vCenter server
Connect-VIServer -Server vcenter.contoso.test

# List all ESXi hosts
Get-VMHost
# List all clusters
Get-Cluster
# Which hosts are in the cluster?
Get-Cluster -Name Cluster-01 | Get-VMHost

# List all VMs, sorted alphabetically by name
Get-VM | Sort-Object -Property Name
# How many VMs is that?
(Get-VM).Count
# How many powered on VMs do we have?
(Get-VM | Where-Object {$_.PowerState -like '*on'}).Count

# Ok, looking at just Kyle's VMs
Get-VM -Name kr*
Get-VM -Name kr-dev-01
# Get more info on this VM by viewing all properties
Get-VM -Name kr-dev-01 | Select-Object -Property *

# Store the VM in a variable for easier future reference
$kyrd = Get-VM kr-dev-01
# Viewing all properties works the same as before
$kyrd | Select-Object -Property *

# Figure out what you care about today, and just look at those properties
$kyrd | Select-Object -Property Name, HardwareVersion, GuestId
# View the VM hardware version and guest OS for all of Kyle's VMs
Get-VM kr* | Select-Object Name, HardwareVersion, GuestId | Sort-Object Name
